//
//  TextFieldGuessView.swift
//  Shwordle
//
//  Created by Jason Mandozzi on 6/2/22.
//

import SwiftUI

struct TextFieldGuessView: View {
    typealias cs = Constants
    
    @StateObject var gameVm: GameViewModel
    var title: String
    
    var body: some View {
        TextField(title, text: $gameVm.text)
            .disableAutocorrection(true)
            .onSubmit {
                if gameVm.state == .enterWord {
                    if gameVm.text.count == 5 {
                        self.gameVm.text = gameVm.text
                        self.gameVm.answer = GuessModel(string: gameVm.text)
                        gameVm.state = .inGame
                        gameVm.text.removeAll()
                    } else {
                        gameVm.text.removeAll()
                        return
                    }
                } else if gameVm.state == .inGame {
                    guard !gameVm.text.isEmpty && gameVm.text.count == 5 else {
                        gameVm.text.removeAll()
                        return
                    }
                    self.gameVm.text = gameVm.text
                    let submission = GuessModel(string: gameVm.text)
                    gameVm.text.removeAll()
                    gameVm.previousGuesses?.append(submission)
                    gameVm.currentTurn += 1
                    if submission.space1 == gameVm.answer.space1 &&
                        submission.space2 == gameVm.answer.space2 &&
                        submission.space3 == gameVm.answer.space3 &&
                        submission.space4 == gameVm.answer.space4 &&
                        submission.space5 == gameVm.answer.space5 {
                        gameVm.state = .win
                        return
                    }
                    if gameVm.currentTurn == 5 {
                        gameVm.state = .lose
                    }
                }
            }
            .disabled(gameVm.currentTurn==5)
            .textFieldStyle(.roundedBorder)
            .font(.largeTitle)
            .frame(width: cs.textFieldWidth,
                   height: cs.textFieldHeight,
                   alignment: .center)
    }
}
