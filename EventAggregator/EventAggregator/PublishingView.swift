//
//  PublishingView.swift
//  EventAggregator
//
//  Created by Peter Booth on 2022-01-03.
//

import SwiftUI


/// Simple Test View to demonstrate publishing via an EventAggregator
struct PublishingView: View {
    @State var counter = 0
    @EnvironmentObject var appContext : AppContext
    var body: some View {
        Button("Increment Counter", action: incrementCounter)
    }
    
    func incrementCounter() {
        counter += 1
        appContext.eventAggregator.Publish(CounterAction(counterUpdate: counter))
    }
}

struct PublishingView_Previews: PreviewProvider {
    static var previews: some View {
        PublishingView()
    }
}
