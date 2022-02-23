//
//  SettingsGameViewController.swift
//  Alias
//
//  Created by Даня on 23.02.2022.
//

import UIKit

class SettingsGameViewController: UIViewController {

   
    @IBOutlet weak var sportButton: UIButton!
    @IBOutlet weak var filmButton: UIButton!
    @IBOutlet weak var animalsButton: UIButton!
    @IBOutlet weak var historyButton: UIButton!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
    }
    
    
    
    func setupView(){
        sportButton.layer.cornerRadius = 8
        filmButton.layer.cornerRadius = 8
        animalsButton.layer.cornerRadius = 8
        historyButton.layer.cornerRadius = 8
    }

}
