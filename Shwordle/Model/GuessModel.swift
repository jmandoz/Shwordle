//
//  GuessModel.swift
//  Shwordle
//
//  Created by Jason Mandozzi on 6/3/22.
//

import Foundation

struct GuessModel: Identifiable, Hashable {
    var id = UUID()
    var space1: String = ""
    var space2: String = ""
    var space3: String = ""
    var space4: String = ""
    var space5: String = ""
    
    init(string: String = "") {
        self.space1 = string[0].uppercased()
        self.space2 = string[1].uppercased()
        self.space3 = string[2].uppercased()
        self.space4 = string[3].uppercased()
        self.space5 = string[4].uppercased()
    }
    
    var combine: String {
        space1+space2+space3+space4+space5
    }
}
