//
//  GuessModel.swift
//  Shwordle
//
//  Created by Jason Mandozzi on 6/3/22.
//

import Foundation

struct GuessModel: Identifiable, Hashable {
    var id = UUID()
    let space1: String
    let space2: String
    let space3: String
    let space4: String
    let space5: String
    
    var combine: String {
        space1+space2+space3+space4+space5
    }
}
