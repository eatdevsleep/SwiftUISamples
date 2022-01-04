//
//  PEventAggregator.swift
//  EventAggregator
//
//  Created by Peter Booth on 2022-01-01.
//

import Foundation
import Combine

public protocol PEventAggregator {
    func Publish<T>(_ message: T)
    func Subscribe<T>(_ callback: @escaping (T) -> ()) -> Cancellable
}
