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
    var timeConstant: Int = 0
    var time: Int = 0
    var timer = Timer()
    var wordsForVictory = 60
    var wordsWithCategory: Category? = nil
    var teams: [Team] = []
    var selectedTeam: Team? = nil
    var rounds: Int? = nil
    var currentRound: Int = 1
    var currentWord: String? = nil
    var winnerTeam: String? = nil
    var allScores: String? = nil
    //MARK: - Logic
    //game setup (selectedTeam = teams.first, rounds = teams.count)
    //get random word
    //add point for selected team
    //remove point for selected team
    //change selected team after time == 0
    //reset game
    
    //Настройка игры
    func gameSetup(){
        self.selectedTeam = teams[currentRound - 1]
        self.rounds = teams.count
    }
    
    //Получаем рандомное слово
    func getRandomWord(){
        let randomWord = wordsWithCategory?.words.randomElement()
        currentWord = randomWord
    }
    
    //Добавляем очко команде
    func addPoint(){
        selectedTeam?.score += 1
        selectedTeam?.guessedWords += 1
        getRandomWord()
    }
    
    //Отнимаем очко команде
    func removePoint(){
        selectedTeam?.score -= 1
        getRandomWord()
    }
    
    //Получаем название следующей команды
    func getNextTeamName() -> String{
        return teams[currentRound].name
    }
    
    //Меняем выбранную (текущую) команду
    func changeSelectedTeam(){
        time = timeConstant
        currentRound += 1
    }
    
    //Получем название победитея
    func getWinnerTeam() {
        //Добавить исход "Ничья"
//        let filterTeam = teams.elementsEqual(Team, by: { $0.score == $1.score })
        
        let sortedTeam = teams.sorted(by: {
            $0.score > $1.score
        }).first
        
        winnerTeam = sortedTeam?.name
    }
    
    //Получаем очки всех команд
    func getAllScores(){
        var scores = ""
        for team in teams {
            let name = team.name
            let score = team.score
            
            let fullScore = ("\(name): \(score)\n")
            scores += fullScore
        }
        allScores = scores
    }
    
    //Сбрасываем настройки игры
    func resetGame(){
        for team in teams {
            team.score = 0
            team.guessedWords = 0
        }
        timeConstant = 0
        time = 0
        wordsWithCategory = nil
        selectedTeam = nil
        teams = []
        currentRound = 1
        rounds = nil
        winnerTeam = nil
        allScores = nil
    }
}
