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
    var gameData = GameData()
    
    //MARK: - Screen orientation
    override var shouldAutorotate: Bool {
        false
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    //MARK: - Setup views
    func setupViews(){
        for button in [correctButton, skipButton, resetButton]{
            button?.layer.cornerRadius = 8
        }
        setupGame()
    }

    @IBAction func skipButtonTap(_ sender: UIButton) {
        gameData.addPoint()
        currentWordLabel.text = gameData.currentWord
    }
    
    @IBAction func correctButtonTap(_ sender: UIButton) {
        gameData.removePoint()
        currentWordLabel.text = gameData.currentWord
    }
    
    @IBAction func exitButtonTap(_ sender: Any) {
    }
    
    func setupGame(){
        gameData.getRandomWord()
        currentWordLabel.text = gameData.currentWord
        timeLabel.text = String(gameData.time)
    }
}
