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
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        getAlert()
    }
    
    func setupView() {
        outButton.layer.cornerRadius = 8
        navigationController?.navigationBar.isHidden = true
        
        scoreLabel.text = "ОЧКИ"
        winnerLabel.text = "Победила"
    }
    
    @IBAction func quitButtonTap(_ sender: UIButton) {
        gameData.resetGame()
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func getAlert() {
        let alert = UIAlertController(title: "Шутка", message: "", preferredStyle: UIAlertController.Style.alert)
        self.present(alert, animated: true, completion: nil)
    }
}
