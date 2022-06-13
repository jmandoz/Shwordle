//
//  ContentView.swift
//  Shwordle
//
//  Created by Jason Mandozzi on 6/2/22.
//

import SwiftUI

struct ContentView: View {
    private var answer: GuessModel
    @State private var currentTurn = 0
    @State private var text = ""
    @State private var win: Bool = false
    @EnvironmentObject var gameVm: GameViewModel
    
    public init(answer: GuessModel = GuessModel(space1: "G", space2: "L", space3: "O", space4: "V", space5: "E")) {
        self.answer = answer
    }
    
    var body: some View {
        if win {
            VStack {
                Text("You Win!!!")
                HStack {
                    GuessSquareView(letter: answer.space1, color: .green)
                    GuessSquareView(letter: answer.space2, color: .green)
                    GuessSquareView(letter: answer.space3, color: .green)
                    GuessSquareView(letter: answer.space4, color: .green)
                    GuessSquareView(letter: answer.space5, color: .green)
                }
            }
        } else {
            VStack {
                LetterRowView(model: $gameVm.previousGuesses, answer: answer)
                TextFieldGuessView(text: $text)
                    .disableAutocorrection(true)
                    .onSubmit {
                        guard !text.isEmpty && text.count == 5 else {
                            text.removeAll()
                            return
                        }
                        self.text = text
                        currentTurn += 1
                        let submission = GuessModel(space1: text[0].uppercased(),
                                                    space2: text[1].uppercased(),
                                                    space3: text[2].uppercased(),
                                                    space4: text[3].uppercased(),
                                                    space5: text[4].uppercased())
                        gameVm.previousGuesses.append(submission)
                        if submission.space1 == answer.space1 &&
                            submission.space2 == answer.space2 &&
                            submission.space3 == answer.space3 &&
                            submission.space4 == answer.space4 &&
                            submission.space5 == answer.space5 {
                            win = true
                        }
                        text.removeAll()
                    }
                    .disabled(currentTurn==5)
                    .background(currentTurn==5 ? .red : .clear)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(GameViewModel())
    }
}
