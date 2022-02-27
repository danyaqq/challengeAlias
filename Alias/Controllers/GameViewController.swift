//
//  GameViewController.swift
//  Alias
//
//  Created by Даня on 26.02.2022.
//

import UIKit

class GameViewController: UIViewController {
    
    //MARK: - Views
    @IBOutlet weak var correctButton: UIButton!
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var teamLabel: UILabel!
    @IBOutlet weak var correctWordsLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var currentWordLabel: UILabel!
    
    //MARK: - Properties
    var gameData: GameData = GameData()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupGame()
    }
    
    //MARK: - Setup views
    func setupViews(){
        for button in [correctButton, skipButton, resetButton]{
            button?.layer.cornerRadius = 8
        }
        
        navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func skipButtonTap(_ sender: UIButton) {
        gameData.removePoint()
        currentWordLabel.text = gameData.currentWord
        correctWordsLabel.text = String(gameData.selectedTeam?.score ?? 0)
    }
    
    @IBAction func correctButtonTap(_ sender: UIButton) {
        gameData.addPoint()
        currentWordLabel.text = gameData.currentWord
        correctWordsLabel.text = String(gameData.selectedTeam?.score ?? 0)
    }
    
    @IBAction func exitButtonTap(_ sender: Any) {
   
    }
    
    func setupGame(){
        //Запускаем функцию настройки игры
        gameData.gameSetup()
        //Очки команды
        correctWordsLabel.text = String(gameData.selectedTeam?.score ?? 0)
        //Название команды
        teamLabel.text = gameData.selectedTeam?.name
        //Получаем рандомное слово
        gameData.getRandomWord()
        //Обновляем лэйбл
        currentWordLabel.text = gameData.currentWord
        //Запускаем таймер
        timerProcess()
    }
    
    func timerProcess(){
        gameData.timer.invalidate()
        gameData.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToRoundOverVC" {
            let destinationVC = segue.destination as! TheRoundIsOverViewController
            destinationVC.gameData = gameData
            destinationVC.callBack = { [weak self] in
                self?.gameData.changeSelectedTeam()
                self?.setupGame()
            }
        }
        if segue.identifier == "goToSettings" {
            let destinationVC = segue.destination as! MainViewController
            destinationVC.gameData = gameData
            gameData.resetGame()
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
    
    @objc
    func updateTimer() {
        if gameData.time != 0 {
            gameData.time -= 1
            timeLabel.text = String(gameData.time)
        } else {
            gameData.time = 0
            gameData.timer.invalidate()
            //navigate to result screen
            guard let rounds = gameData.rounds else {
                return
            }
            if gameData.currentRound < rounds{
            self.performSegue(withIdentifier: "goToRoundOverVC", sender: self)
            } else {
                self.performSegue(withIdentifier: "goToResult", sender: self)
            }
        }
    }
}
