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
    
    //MARK: - Screen orientation
    override var shouldAutorotate: Bool {
        false
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    @IBAction func playRoundButtonTap(_ sender: UIButton) {
        
    
    }
    func setupView() {
        playRoundButton.layer.cornerRadius = 8
        
    }
}
