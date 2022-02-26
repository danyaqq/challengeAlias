//
//  GameData.swift
//  Alias
//
//  Created by Даня on 26.02.2022.
//

import Foundation


class GameData{
    //MARK: - Properties
    //time, words for victory, category + words, teams, selectedTeams,
    //rounds (teams.count), currentRound, current word
    var time: Int = 0
    var wordsForVictory = 60
    var wordsWithCategory: Category? = nil
    var teams: [String]? = nil
    var selectedTeam: String? = nil
    var rounds: Int? = nil
    var currentRound: Int? = nil
    var currentWord: String? = nil
    
    //MARK: - Logic
    //game setup (selectedTeam = teams.first, rounds = teams.count)
    //add point for selected team
    //remove point for selected team
    //change selected team after time == 0
    //reset game
}
