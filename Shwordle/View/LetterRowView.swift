//
//  LetterRowView.swift
//  Shwordle
//
//  Created by Jason Mandozzi on 6/2/22.
//

import SwiftUI
import UIKit

struct LetterRowView: View {
    @Binding var model: [GuessModel]?
    var answer: GuessModel
    typealias cs = Constants
    
    var body: some View {
        ForEach(model ?? []) { m in
            HStack {
                GuessSquareView(letter: m.space1, color: backgroundColor(answerLetter: answer.space1, letter: m.space1))
                GuessSquareView(letter: m.space2, color: backgroundColor(answerLetter: answer.space2, letter: m.space2))
                GuessSquareView(letter: m.space3, color: backgroundColor(answerLetter: answer.space3, letter: m.space3))
                GuessSquareView(letter: m.space4, color: backgroundColor(answerLetter: answer.space4, letter: m.space4))
                GuessSquareView(letter: m.space5, color: backgroundColor(answerLetter: answer.space5, letter: m.space5))
            }
        }
    }
    
    func backgroundColor(answerLetter: String, letter: String) -> Color {
        if letter == answerLetter {
            return .green
        } else if answer.space1 == letter ||
                    answer.space2 == letter ||
                    answer.space3 == letter ||
                    answer.space4 == letter ||
                    answer.space5 == letter
        {
            return .yellow
        } else {
            return .gray
        }
    }
}
