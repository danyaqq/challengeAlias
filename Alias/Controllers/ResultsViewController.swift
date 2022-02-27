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
    var jokeManager = JokeManager()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        jokeManager.delegate = self
    }
    
    func setupView() {
        outButton.layer.cornerRadius = 8
        navigationController?.navigationBar.isHidden = true
        
// hello
    
        scoreLabel.text = "ОЧКИ"
        winnerLabel.text = "Победила"
    }
    
    @IBAction func quitButtonTap(_ sender: UIButton) {
        gameData.resetGame()
        self.navigationController?.popToRootViewController(animated: true)
    }
}

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
