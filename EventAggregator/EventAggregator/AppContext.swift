//
//  AppContext.swift
//  EventAggregator
//
//  Created by Peter Booth on 2022-01-03.
//

import SwiftUI

class AppContext : ObservableObject {
    public let eventAggregator : PEventAggregator = EventAggregator()
}
