//
//  SubscribingView.swift
//  EventAggregator
//
//  Created by Peter Booth on 2022-01-03.
//

import SwiftUI
import Combine

struct SubscribingView: View {
    @State var counter : Int = 0;
    @EnvironmentObject var appContext : AppContext
    @State var subscription : Cancellable? = nil
    
    var body: some View {
        HStack {
            Label("Counter", systemImage: "bolt.fill")
                .labelStyle(.titleOnly)
            Text("\(counter)")
                // In reality this would be encapsulated in the ViewModel, it is in the View here to demonstrate the concept of EventAggregator based decoupling
                .onAppear{
                    subscription = appContext.eventAggregator.Subscribe(onCounterAction)
                }
                .onDisappear{
                    subscription?.cancel()
                }
        }
    }

    func onCounterAction(counterAction:CounterAction){
        self.counter = counterAction.counterUpdate
    }
}

struct SubscribingView_Previews: PreviewProvider {
    static var previews: some View {
        SubscribingView()
    }
}
