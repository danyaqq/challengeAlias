//
//  TheRoundIsOverViewController.swift
//  Alias
//
//  Created by Даня on 26.02.2022.
//

import UIKit

class TheRoundIsOverViewController: UIViewController {

    //MARK: - Views
    @IBOutlet weak var currentTeamLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var playRoundButton: UIButton!
    
    
    
    //MARK: - Properties
    var gameData = GameData()
    var score: Int?
    var callBack: (()-> ())?
    var jokeManager = JokeManager()
    var joke: String = ""
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        jokeManager.delegate = self
    }
    
    @IBAction func playRoundButtonTap(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        callBack?()
    }
    
    func setupView() {
        playRoundButton.layer.cornerRadius = 8
        
        scoreLabel.text = "ОЧКИ\n\(String(describing: gameData.selectedTeam!.name)):  \(gameData.selectedTeam?.score ?? 0)"
        currentTeamLabel.text = "Следующая играет: \(gameData.getNextTeamName())"
    }
}

extension TheRoundIsOverViewController: JokeManagerDelegate{
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
