//
//  DependencyView.swift
//  EventAggregator
//
//  Created by Peter Booth on 2022-01-01.
//

import SwiftUI

/// Intended to be the top level view in the SwiftUI hierarchy where all global dependencies are injected
/// This allows this layer to swapped out for testing scenarios
struct DependencyView: View {
    // inject dependencies as stateobjects, then inject to Content view using EnvironmentObject
    @StateObject var appContext = AppContext()
    
    var body: some View {
        ContentView()
            .environmentObject(appContext)
    }
}

struct DependencyView_Previews: PreviewProvider {
    static var previews: some View {
        DependencyView()
    }
}
