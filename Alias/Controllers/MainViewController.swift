//
//  MainViewController.swift
//  Alias
//
//  Created by Даня on 23.02.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    //MARK: - Views
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var howToPlayButton: UIButton!
    @IBOutlet weak var teamsCount: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    //MARK: - Properties
    var gameData: GameData = GameData()
    var teams: [Team] = []
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    //MARK: - Setup views
    func setupView(){
        startButton.layer.cornerRadius = 8
        howToPlayButton.layer.cornerRadius = 8
        stepper.minimumValue = 2
    }
    
    @IBAction func stepperTapped(_ sender: UIStepper) {
        teamsCount.text = "Количество команд: \(Int(sender.value))"
    }
    
    @IBAction func nextButtonTap(_ sender: UIButton) {
        for i in 1...Int(stepper.value){
            teams.append(Team(name: "Команда \(i)"))
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        gameData.teams = teams
        if segue.identifier == "goToSettings" {
            let destinationVC = segue.destination as! SettingsGameViewController
            destinationVC.gameData = gameData
        }
    }
    
}

