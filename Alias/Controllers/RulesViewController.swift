//
//  RulesViewController.swift
//  Alias
//
//  Created by Даня on 23.02.2022.
//

import UIKit

class RulesViewController: UIViewController {
    
    @IBOutlet weak var firstText: UILabel!
    @IBOutlet weak var secondText: UILabel!
    @IBOutlet weak var thirdText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView(){
        firstText.text = "В игру играют командами из двух или более человек. Задача каждого игрока команды объяснить как можно больше слов, отображаемых на экране за ограниченное время другими словами, используя, например, синонимы, антонимы и подсказки так, чтобы члены Вашей команды смогли отгадать как можно больше слов прежде чем истечет время. Чем больше слов отгадала команда, тем больше она заработает баллов."
        secondText.text = "При объяснении слов нельзя упоминать какую-либо часть слова. Например, слово «кофеварка» нельзя объяснять как «аппарат для варки кофе». Правильный способ, объяснения будет следующий: «аппарат для приготовления крепкого напитка, который обычно пьют за «завтраком». Можно сказать «кипятить», но не «варить».\n\nВы можете использовать антонимы. Слово «большой» может быть объяснено как антоним слова «маленький». Вы не может использовать иностранные языки за исключением тех случаев, когда все игроки согласны на это.\n\nОтгаданное слово должно точно совпадать с тем, что отображается на экране. Объясняющий игрок помогает своей команде найти правильную форму слова. Если слово состоит из двух частей и кто-то отгадал первую часть, то Вы можете использовать отгаданную часть слова для дальнейшего объяснения."
        thirdText.text = "За каждое отгаданное слово команда получает 1 очко, а за пропущенное или отгаданное с нарушением - штрафуется 1 очком.\n\nЕсли объясняющий игрок допускает ошибку, например, называет часть слова, указанного в карточке, слово не будет принято и команда потеряет 1 очко. Поэтому каждая команда должна внимательно слушать объяснения других команд. Слово можно пропустить, но помните, за это Вы потеряете 1 очко. Однако, иногда это того стоит, так как Вы можете сэкономить время.\n\nПобедителем считается команда, набравшая наибольшее количество очков. Если на момент завершения победного раунда у нескольких команд одинаковое количество очков - проводится дополнительный раунд."
    }
    
}
