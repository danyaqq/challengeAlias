//
//  MainViewController.swift
//  Alias
//
//  Created by Даня on 23.02.2022.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var howToPlayButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    func setupView(){
        startButton.layer.cornerRadius = 8
        howToPlayButton.layer.cornerRadius = 8
    }

}

