//
//  EventAggregator.swift
//  EventAggregator
//
//  Created by Peter Booth on 2022-01-01.
//

import Foundation
import Combine


/// EventAggregator is intended to be used as in SwiftUI as a simple mechanism to allow SwiftUI components to communicate in a decoupled manner
struct EventAggregator : PEventAggregator {

    public let notificationCenter : NotificationCenter =  NotificationCenter.default
    public let mainQueue : OperationQueue? = OperationQueue.main
    
    func Publish<T>(_ message: T) {
        notificationCenter.post(
            name: NSNotification.Name(rawValue: String(describing: T.self)),
            object: message)
    }
    
    // for explanation of @escaping - https://betterprogramming.pub/escaping-and-non-escaping-closures-in-swift-fe2866309599
    func Subscribe<T>(_ callback: @escaping (T) -> ()) -> Cancellable {
        return Unsubscriber(
            notificationCenter: notificationCenter,
            observer:
                notificationCenter.addObserver(
                    forName: NSNotification.Name(rawValue: String(describing: T.self)),
                    object:nil,
                    queue: mainQueue,
                    using: {(n:Notification) -> Void in
                        if let item = n.object as? T {
                            callback(item)
                        }
                        else {
                            assertionFailure("Subscription callback failed. Could not convert payload to Type '\(T.self)'")
                        }
                    }))
    }
    
    class Unsubscriber : Cancellable {
        
        private let notificationCenter : NotificationCenter
        private let observer : NSObjectProtocol
        
        init (notificationCenter : NotificationCenter, observer : NSObjectProtocol){
            self.notificationCenter = notificationCenter
            self.observer = observer
        }
        
        func cancel() {
            notificationCenter.removeObserver(observer)
        }
    }
    
}
