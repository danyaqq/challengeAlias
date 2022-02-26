//
//  GameData.swift
//  Alias
//
//  Created by Даня on 26.02.2022.
//

import UIKit

class GameData{
    //MARK: - Properties
    //time, words for victory, category + words, teams, selectedTeams,
    //rounds (teams.count), currentRound, current word
    var time: Int = 0
    var timer = Timer()
    var wordsForVictory = 60
    var wordsWithCategory: Category? = nil
    var teams: [Team] = []
    var selectedTeam: Team? = nil
    var rounds: Int? = nil
    var currentRound: Int = 1
    var currentWord: String? = nil
    
    //MARK: - Logic
    //game setup (selectedTeam = teams.first, rounds = teams.count)
    //get random word
    //add point for selected team
    //remove point for selected team
    //change selected team after time == 0
    //reset game
    func gameSetup(){
        self.selectedTeam = teams.first
        self.rounds = teams.count
    }
    
    func getRandomWord(){
        let randomWord = wordsWithCategory?.words.randomElement()
        currentWord = randomWord
    }
    
    //timer creation
    func timerProcess(){
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if time >= 1 {
            time -= 1
            print(time)
        } else {
            time = 0
            timer.invalidate()
        }
    }
    
    func addPoint(){
        selectedTeam?.score += 1
        selectedTeam?.guessedWords += 1
        getRandomWord()
    }
    
    func removePoint(){
        selectedTeam?.score -= 1
        getRandomWord()
    }
    
    func changeSelectedTeam(){
        currentRound += 1
        selectedTeam = teams[currentRound - 1]
    }
    
    func resetGame(){
        for team in teams {
            team.score = 0
            team.guessedWords = 0
        }
        selectedTeam = teams[0]
        currentRound = 1
    }
}
