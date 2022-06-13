//
//  TextFieldGuessView.swift
//  Shwordle
//
//  Created by Jason Mandozzi on 6/2/22.
//

import SwiftUI

struct TextFieldGuessView: View {
    typealias cs = Constants
    
    @Binding var text: String
    
    var body: some View {
        TextField("Enter Guess Here", text: $text)
            .frame(width: cs.textFieldWidth,
                   height: cs.textFieldHeight,
                   alignment: .center)
    }
}
