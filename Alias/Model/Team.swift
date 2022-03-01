//
//  Team.swift
//  Alias
//
//  Created by Даня on 26.02.2022.
//

import Foundation

class Team: Comparable{
    var name: String
    var score: Int = 0
    var guessedWords: Int = 0
    
    init(name: String){
        self.name = name
    }
    
    static func == (lhs: Team, rhs: Team) -> Bool {
        return lhs.score == rhs.score
    }
    
    static func < (lhs: Team, rhs: Team) -> Bool {
        return lhs.score < rhs.score
    }
}
