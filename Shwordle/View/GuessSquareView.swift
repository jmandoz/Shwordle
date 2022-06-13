//
//  GuessSquareView.swift
//  Shwordle
//
//  Created by Jason Mandozzi on 6/10/22.
//

import SwiftUI

struct GuessSquareView: View {
    typealias cs = Constants
    var letter: String
    var color: Color
    var body: some View {
        ZStack {
            Rectangle()
                .strokeBorder(style:
                        .init(lineWidth: 1,
                              lineCap: .round,
                              lineJoin: .round,
                              miterLimit: 1, dash: [],
                              dashPhase: 0)
                )
                .frame(width: cs.tileWidth,
                       height: cs.tileHeight,
                       alignment: .center)
                .padding(3)
            Text(letter)
        }
        .background(color)
    }
}
