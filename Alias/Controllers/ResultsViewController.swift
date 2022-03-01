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
    @IBOutlet weak var scoresLabel: UILabel!
    @IBOutlet weak var outButton: UIButton!
    
    //MARK: - Properties
    var gameData = GameData()
    var jokeManager = JokeManager()
    
    //MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        gameData.getWinnerTeam()
        gameData.getAllScores()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        jokeManager.delegate = self
    }
    
    //MARK: - Setup view
    func setupView() {
        //Скругляем края кнопке
        outButton.layer.cornerRadius = 8
        //Скрываем navigationBar
        navigationController?.navigationBar.isHidden = true
        
        winnerLabel.text = "Победила\n\(gameData.winnerTeam ?? "Ничья")"
        scoresLabel.text = gameData.allScores ?? ""
        
    }
    
    //MARK: - Actions
    @IBAction func quitButtonTap(_ sender: UIButton) {
        //Переход на root view controller (MainViewController)
        self.navigationController?.popToRootViewController(animated: true)
    }
}


//MARK: - JokeManagerDelegate
extension ResultsViewController: JokeManagerDelegate{
    func didUpdateJoke(_ jokeManager: JokeManager, joke: Joke) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Шутка", message: joke.joke, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default) {_ in
                alert.dismiss(animated: true, completion: nil)
            })
            self.present(alert, animated: true, completion: nil)
        }
    }
}
