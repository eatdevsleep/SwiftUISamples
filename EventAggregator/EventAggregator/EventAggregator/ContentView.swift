//
//  ContentView.swift
//  EventAggregator
//
//  Created by Peter Booth on 2022-01-03.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            Text("Event Aggregator Demo")
                .padding()
            PublishingView()
                .padding()
            SubscribingView()
                .padding()
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
