//
//  GameViewModel.swift
//  Shwordle
//
//  Created by Jason Mandozzi on 6/10/22.
//

import Foundation

class GameViewModel: ObservableObject {
    @Published var currentGuess: GuessModel?
    @Published var previousGuesses: [GuessModel] = []
}
