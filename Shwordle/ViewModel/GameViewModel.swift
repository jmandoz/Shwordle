//
//  GameViewModel.swift
//  Shwordle
//
//  Created by Jason Mandozzi on 6/10/22.
//

import Foundation
import Combine

@MainActor class GameViewModel: ObservableObject {
    @Published var currentGuess: GuessModel?
    @Published var previousGuesses: [GuessModel]? = []
    @Published var state: ViewState = .initialized
    @Published var answer: GuessModel = GuessModel()
    @Published var currentTurn = 0
    @Published var text = ""
    
    var cancellables = Set<AnyCancellable>()
    
    init() {
        addTextFieldSubscriber()
    }
    
    private func addTextFieldSubscriber() {
        $text.map { text -> GuessModel in
            return GuessModel(string: text)
        }
        .sink { [weak self] model in
            guard let strongSelf = self else { return }
            strongSelf.currentGuess = model
        }
        .store(in: &cancellables)
    }
}

enum ViewState {
    case initialized
    case enterWord
    case inGame
    case win
    case lose
}
