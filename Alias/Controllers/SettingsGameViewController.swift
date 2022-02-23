//
//  SettingsGameViewController.swift
//  Alias
//
//  Created by Даня on 23.02.2022.
//

import UIKit

class SettingsGameViewController: UIViewController {

    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView(){
        nextButton.layer.cornerRadius = 8
    }

}
