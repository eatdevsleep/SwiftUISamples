//
//  ContentViewFactory.swift
//  ModelViewViewModel
//
//  Created by Peter Booth on 2022-01-05.
//

import SwiftUI

// A wrapper view with the responsibility to construct and inject the ViewModel
// The is a pattern that can be applied to all Views that require a ViewModel
struct ContentViewFactory: View {
    @EnvironmentObject var viewModelFactory : ViewModelFactory
    @State var parameters : ContentViewParam
    
    var body: some View {
        // https://stackoverflow.com/questions/40470145/errors-thrown-from-here-are-not-handled/40470270
        ContentView(viewModel: try! viewModelFactory.Create(from: parameters))
    }
}

struct ContentViewFactory_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewFactory(parameters: ContentViewParam(messageNumber: 2))
    }
}
