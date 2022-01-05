//
//  ContentView.swift
//  ModelViewViewModel
//
//  Created by Peter Booth on 2022-01-04.
//

import SwiftUI

// An example view to demonstrate injecting a ViewModel
struct ContentView: View{
    @ObservedObject var viewModel : ContentViewModel
    
    var body: some View {
        VStack{
            Button("Get Message"){
                    viewModel.FetchMessageCommand()
                }
            Text(viewModel.currentMessage)
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(
            viewModel: ContentViewModel(
                parameters: ContentViewParam(messageNumber: 2),
                appContext: AppContext()))
    }
}
