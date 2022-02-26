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
    
    //MARK: - Screen orientation
    override var shouldAutorotate: Bool {
        false
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    @IBAction func outButtonTap(_ sender: UIButton) {
    
    }
    
    func setupView() {
        outButton.layer.cornerRadius = 8
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
