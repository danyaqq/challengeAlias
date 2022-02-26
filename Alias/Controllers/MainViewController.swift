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
//        teamsCount
    }
}

