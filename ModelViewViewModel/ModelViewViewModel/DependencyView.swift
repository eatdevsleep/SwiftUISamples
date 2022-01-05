//
//  DependencyView.swift
//  ModelViewViewModel
//
//  Created by Peter Booth on 2022-01-04.
//

import SwiftUI

// This View has the responsibility to initialise and inject all the required @EnvironmentObject instances into the Application
struct DependencyView: View {
//    @ObservedObject var appContext : AppContext
    var appContext : PAppContext
    // The ViewModelFactory owns the appContext from here
    @StateObject var viewModelFactory: ViewModelFactory = ViewModelFactory()
   
//    init(appContext : PAppContext){
//        self.appContext = appContext
//    }
    
    var body: some View {
        VStack{
            if(viewModelFactory.isInitialised){
                RootContentView()
                    .environmentObject(viewModelFactory)
            }
            else{
                Text("Loading")
            }
        }.onAppear{
            viewModelFactory.injectDependencies(appContext: appContext)
            // Register ViewModels here
            // ...
            viewModelFactory.Register(){ContentViewModel(parameters: $0, appContext: $1)}
            // using trailing closure syntax and shorthand argument names greatly simplifies the above
            // https://docs.swift.org/swift-book/LanguageGuide/Closures.html
            viewModelFactory.InitComplete()
        }
    }
}

struct DependencyView_Previews: PreviewProvider {
    static var previews: some View {
        DependencyView(appContext: AppContext())
    }
}
