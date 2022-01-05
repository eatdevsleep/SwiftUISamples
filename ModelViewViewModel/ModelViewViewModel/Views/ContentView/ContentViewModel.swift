//
//  ContentViewModel.swift
//  ModelViewViewModel
//
//  Created by Peter Booth on 2022-01-04.
//

import Foundation
import SwiftUI

// An example ViewModel
class ContentViewModel : ObservableObject {
    
    @Published var currentMessage : String = ""
    
    private let parameters : ContentViewParam
    private let appContext : PAppContext
    
    init(parameters:ContentViewParam, appContext:PAppContext){
        self.parameters = parameters
        self.appContext = appContext
    }
    
    func FetchMessageCommand(){
        currentMessage = appContext.messageService.GetMessage(messageNumber: self.parameters.messageNumber)
    }
}
