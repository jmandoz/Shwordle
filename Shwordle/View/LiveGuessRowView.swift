//
//  LiveGuessRowView.swift
//  Shwordle
//
//  Created by Jason Mandozzi on 6/17/22.
//

import SwiftUI

struct LiveGuessRowView: View {
    @Binding var text: String
    var body: some View {
        HStack {
            GuessSquareView(letter: text[0], color: .white)
            GuessSquareView(letter: text[1], color: .white)
            GuessSquareView(letter: text[2], color: .white)
            GuessSquareView(letter: text[3], color: .white)
            GuessSquareView(letter: text[4], color: .white)
        }
    }
}

struct LiveGuessRowView_Previews: PreviewProvider {
    static var previews: some View {
        LiveGuessRowView(text: .constant("Hello"))
    }
}
