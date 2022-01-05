//
//  AppContextView.swift
//  ModelViewViewModel
//
//  Created by Peter Booth on 2022-01-05.
//

import SwiftUI

// This Top-Level view has the responsibility to inject all of the services and config via the PAppContext protocol
// The design intent was that his view can be swapped out for testing purposes (it depends on a concrete implementation of the AppContext which can be swapped out for a Mock AppContext)
struct AppContextView: View {
    // Top-Level View - contains the appContext
    var appContext : PAppContext = AppContext() // todo does this need to be a @StateObject? with reference counting it will be preserved in the ViewModelFactory in the DependencyView... answer is, probably not then and this means we can use the protocol to refer to it, perhaps delegating the construction of AppContext to a Factory later
    var body: some View {
        DependencyView(appContext: appContext)
    }
}

struct AppContextView_Previews: PreviewProvider {
    static var previews: some View {
        AppContextView()
    }
}
