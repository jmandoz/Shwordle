//
//  ContentView.swift
//  Shwordle
//
//  Created by Jason Mandozzi on 6/2/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var gameVm: GameViewModel
    
    var body: some View {
        switch gameVm.state {
        case .initialized:
            VStack {
                Text("Shwordle")
                    .font(.largeTitle)
                HStack{
                    Button {
                        gameVm.state = .enterWord
                    } label: {
                        Text("Enter Word")
                            .font(.largeTitle)
                    }
                    .frame(width: 250, height: 150, alignment: .center)
                }
            }
        case .enterWord:
            VStack {
                Text("Enter 5-letter Word for your opponent to guess")
                    .font(.title)
                TextFieldGuessView(gameVm: gameVm, title: "Type here...")
            }
            .padding()
        case .inGame:
            VStack {
                Text("Current Turn: \(gameVm.currentTurn)")
                    .font(.title)
                    .padding()
                Spacer()
                LetterRowView(model: $gameVm.previousGuesses, answer: gameVm.answer)
                LiveGuessRowView(text: $gameVm.text)
                TextFieldGuessView(gameVm: gameVm, title: "Type here...")
            }
        case .win:
            VStack {
                Text("You Win!!!")
                    .font(.largeTitle)
                Text("You got it in \(gameVm.currentTurn)")
                HStack {
                    GuessSquareView(letter: gameVm.answer.space1, color: .green)
                    GuessSquareView(letter: gameVm.answer.space2, color: .green)
                    GuessSquareView(letter: gameVm.answer.space3, color: .green)
                    GuessSquareView(letter: gameVm.answer.space4, color: .green)
                    GuessSquareView(letter: gameVm.answer.space5, color: .green)
                }
                Button {
                    gameVm.answer = GuessModel()
                    gameVm.currentTurn = 0
                    gameVm.state = .enterWord
                    gameVm.previousGuesses?.removeAll()
                } label: {
                    Text("Start Over")
                }
            }
        case .lose:
            Text("Loser")
            Button {
                gameVm.answer = GuessModel()
                gameVm.currentTurn = 0
                gameVm.state = .enterWord
                gameVm.previousGuesses?.removeAll()
            } label: {
                Text("Start Over")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(gameVm: GameViewModel())
    }
}
