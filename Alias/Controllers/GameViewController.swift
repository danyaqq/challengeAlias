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
    var player = Audioplayer()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupGame()
    }
    
    //MARK: - Setup views
    func setupViews(){
        //Скругляем края кнопкам
        for button in [correctButton, skipButton, resetButton]{
            button?.layer.cornerRadius = 8
        }
        
        //Скрываем navigationBar
        navigationController?.navigationBar.isHidden = true
    }
    
    //MARK: - Actions
    @IBAction func skipButtonTap(_ sender: UIButton) {
        //Воспроизведение звука при нажатие на кнопку
        player.playSound(resource: (sender.titleLabel?.text)!)
        //Минус очко команде
        gameData.removePoint()
        
        currentWordLabel.text = gameData.currentWord
        correctWordsLabel.text = String(gameData.selectedTeam?.score ?? 0)
    }
    
    @IBAction func correctButtonTap(_ sender: UIButton) {
        //Воспроизведение звука при нажатие на кнопку
        player.playSound(resource: (sender.titleLabel?.text)!)
        //Плюс очка команде
        gameData.addPoint()
        
        currentWordLabel.text = gameData.currentWord
        correctWordsLabel.text = String(gameData.selectedTeam?.score ?? 0)
    }
    
    @IBAction func exitButtonTap(_ sender: Any) {
        //Воспроизведение звука при нажатие на кнопку
        player.playSound(resource: ((sender as AnyObject).titleLabel?.text)!)
        //Переход на root view controller (MainViewController)
        navigationController?.popToRootViewController(animated: true)
    }
    
    //MARK: - Methods
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
    
    //Timer
    func timerProcess(){
        //Обнуляем таймер для предотвращения зацикливания и потворного запуска
        gameData.timer.invalidate()
        //Запуск таймера
        gameData.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc
    func updateTimer() {
        if gameData.time != 0 {
            gameData.time -= 1
            timeLabel.text = String(gameData.time)
        } else {
            gameData.time = 0
            gameData.timer.invalidate()

            guard let rounds = gameData.rounds else {
                return
            }
            //Переходы на контролеры
            if gameData.currentRound < rounds{
            self.performSegue(withIdentifier: "goToRoundOverVC", sender: self)
            } else {
                self.performSegue(withIdentifier: "goToResult", sender: self)
            }
        }
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToRoundOverVC" {
            let destinationVC = segue.destination as! TheRoundIsOverViewController
            destinationVC.gameData = gameData
            destinationVC.callBack = { [weak self] in
                self?.gameData.changeSelectedTeam()
                self?.setupGame()
            }
        }
        
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.gameData = gameData
        }
    }
}
