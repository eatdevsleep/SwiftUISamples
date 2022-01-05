//
//  AppContext.swift
//  ModelViewViewModel
//
//  Created by Peter Booth on 2022-01-04.
//

import Foundation

protocol PAppContext {
    var messageService : PMessageService {get}
    // Add app services here
    // Add app config here
}

// To be used as a @EnvironmentObject it needs to implement ObservableObject
// It's usages in the Views must be via the concrete type
// However, the protocol is included so that it can be passed into the ViewModel as a protocol
class AppContext : ObservableObject & PAppContext{
    // This is a read-only property so the use of @Published is not required
    let messageService : PMessageService = MockMessageService()
}
