//
//  SettingsGameViewController.swift
//  Alias
//
//  Created by Даня on 23.02.2022.
//

import UIKit

class SettingsGameViewController: UIViewController {
    
    //MARK: - Views
    @IBOutlet weak var sportButton: UIButton!
    @IBOutlet weak var filmButton: UIButton!
    @IBOutlet weak var animalsButton: UIButton!
    @IBOutlet weak var historyButton: UIButton!
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var oneMinuteButton: UIButton!
    @IBOutlet weak var twoMinuteButton: UIButton!
    @IBOutlet weak var threeMinuteButton: UIButton!
    
    //MARK: - Properties
    var selectedCategory: String = "Спорт"
    var wordsWithCategory: Category = Category.sport
    var selectedTime: Int = 60
    var gameData: GameData = GameData()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    //MARK: - Setup views
    func setupView(){
        for button in [sportButton, filmButton, animalsButton, historyButton, startButton, oneMinuteButton, twoMinuteButton, threeMinuteButton]{
            button?.layer.cornerRadius = 8
        }
        
        //Задаём тэги кнопкам, чтобы потом приравнивать их выбранному времени
        oneMinuteButton.tag = 60
        twoMinuteButton.tag = 120
        threeMinuteButton.tag = 180
        
        //Нажимаем на кнопку "1 минута" при инициализации view
        oneMinuteButton.sendActions(for: .touchUpInside)
        
        //Нажимаем на кнопку "Спорт" при инициализации view
        sportButton.sendActions(for: .touchUpInside)
    }
    
    //MARK: - Actions
    
    //Выбранное время становится равным тэгу кнопки
    //Добавляем border при нажатие на кнопку
    //Убираем border у других кнопок
    //Это костыль, но другого варианта у нас нет :(
    @IBAction func oneMinuteTap(_ sender: UIButton) {
        selectedTime = sender.tag
        sender.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        sender.layer.borderWidth = 4
        
        for button in [twoMinuteButton, threeMinuteButton]{
            button?.layer.borderWidth = 0
            button?.layer.borderColor = nil
        }
        selectedTime = sender.tag
    }
    
    @IBAction func twoMinuteTap(_ sender: UIButton) {
        sender.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        sender.layer.borderWidth = 4
        
        for button in [oneMinuteButton, threeMinuteButton]{
            button?.layer.borderWidth = 0
            button?.layer.borderColor = nil
        }
        selectedTime = sender.tag
    }
    
    @IBAction func threeMinuteTap(_ sender: UIButton) {
        sender.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        sender.layer.borderWidth = 4
        
        for button in [oneMinuteButton, twoMinuteButton]{
            button?.layer.borderWidth = 0
            button?.layer.borderColor = nil
        }
        selectedTime = sender.tag
    }
    
    //Присваиваем selectedCategory текст кнопки и меняем background
    @IBAction func categoryButtonTapped(_ sender: UIButton) {
        guard let text = sender.titleLabel?.text else {
            return
        }
        selectedCategory = text
        
        for button in [sportButton, filmButton, animalsButton, historyButton]{
            if selectedCategory == button?.titleLabel?.text{
                button?.backgroundColor = .lightGray
            } else {
                button?.backgroundColor = .white
            }
        }
        
        if selectedCategory == "Спорт"{
            wordsWithCategory = .sport
        } else if selectedCategory == "Животные"{
            wordsWithCategory = .animals
        } else if selectedCategory == "История"{
            wordsWithCategory = .history
        } else if selectedCategory == "Фильм"{
            wordsWithCategory = .film
        }
    }
    
    @IBAction func startButtonTap(_ sender: UIButton) {
        gameData.time = selectedTime
        gameData.wordsWithCategory = wordsWithCategory
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToGame" {
            let destinationVC = segue.destination as! GameViewController
            destinationVC.gameData = gameData
        }
    }
    
}
