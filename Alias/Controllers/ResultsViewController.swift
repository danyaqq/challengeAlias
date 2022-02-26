//
//  ResultsViewController.swift
//  Alias
//
//  Created by Даня on 26.02.2022.
//

import UIKit

class ResultsViewController: UIViewController {

    //MARK: - Views
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var outButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    //MARK: - Properties
    var gameData = GameData()
    override var shouldAutorotate: Bool {
        false
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        outButton.layer.cornerRadius = 8
        navigationController?.navigationBar.isHidden = true
    }

    @IBAction func quitButtonTap(_ sender: UIButton) {
        gameData.resetGame()
        self.navigationController?.popToRootViewController(animated: true)
    }
}
