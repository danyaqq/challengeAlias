//
//  TeamsViewController.swift
//  Alias
//
//  Created by Даня on 24.02.2022.
//

import UIKit

class TeamsViewController: UIViewController{

    @IBOutlet weak var nextButton: UIButton!
    
    override var shouldAutorotate: Bool {
        false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews(){
        nextButton.layer.cornerRadius = 8
    }

}



