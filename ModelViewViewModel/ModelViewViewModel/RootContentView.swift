//
//  RootContentView.swift
//  ModelViewViewModel
//
//  Created by Peter Booth on 2022-01-05.
//

import SwiftUI

struct RootContentView: View {
    var body: some View {
        ContentViewFactory(parameters: ContentViewParam(messageNumber: 1))
    }
}

struct RootContentView_Previews: PreviewProvider {
    static var previews: some View {
        RootContentView()
    }
}
