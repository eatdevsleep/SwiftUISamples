//
//  MockMessageService.swift
//  ModelViewViewModel
//
//  Created by Peter Booth on 2022-01-04.
//

import Foundation

protocol PMessageService {
    func GetMessage(messageNumber : Int) -> String
}

class MockMessageService : PMessageService {
    
    let mockMessages = ["Hi There!", "Hey There!", "Who There?"]
    
    func GetMessage(messageNumber : Int) -> String {
        return mockMessages[messageNumber]
    }
}
