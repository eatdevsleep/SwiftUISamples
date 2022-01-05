//
//  ViewModelFactory.swift
//  ModelViewViewModel
//
//  Created by Peter Booth on 2022-01-04.
//

import Foundation
import SwiftUI

enum ViewModelError: Error {
    case ViewModelNoDependencies
    case ViewModelNotFound(ParamType: String)
}

protocol PViewModelFactory : ObservableObject {
    func Create<T : ObservableObject,TParams>(from parameters: TParams) throws -> T
}

class ViewModelFactory : ObservableObject & PViewModelFactory {
    @Published var isInitialised : Bool = false
    
    private var appContext : PAppContext?
    private var constructors: [String: Any] = [:]
    
    // All Classes that are used as a @StateObject will need some of post initialisation method to inject further dependencies cleanly
    // @StateObjects can only be constructed in place on a View which means any dependencies to the init method need to be hard-coded
    func injectDependencies(appContext : PAppContext){
        self.appContext = appContext
    }
    
    func Register<T : ObservableObject,TParams>(constructor : @escaping (TParams, PAppContext) -> T) {
        let paramsName = String(describing: TParams.self) // every ViewModel is keyed by the name of it's Parameter Type
        constructors[paramsName] = constructor
    }
    
    func InitComplete(){
        isInitialised = true
    }
    
    func Create<T : ObservableObject,TParams>(from parameters: TParams) throws -> T {
        if let appContextValue : PAppContext = appContext {
            let paramsName = String(describing: TParams.self)
            let factoryMethodAny = constructors[paramsName]
            if let factoryMethod = factoryMethodAny as? (TParams, PAppContext) -> T {
                return factoryMethod(parameters, appContextValue)
            }
            throw ViewModelError.ViewModelNotFound(ParamType: paramsName)
        }
        throw ViewModelError.ViewModelNoDependencies
    }
    
}
