//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Nikita Zharinov on 01/11/2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var resultAnimalLabel: UILabel!
    @IBOutlet var resultDescriptionLabel: UILabel!
    
    var chosenAnimal: [Answer] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: false)
        
        chooseTheRightAnimal()
    }

    private func chooseTheRightAnimal() {
        var animalsDictionary = [AnimalType.dog: 0, AnimalType.cat: 0, AnimalType.rabbit: 0, AnimalType.turtle: 0]
        
        for animal in chosenAnimal {
            
            switch animal.type {
            case AnimalType.dog:
                animalsDictionary[AnimalType.dog]! += 1
            case AnimalType.cat:
                animalsDictionary[AnimalType.cat]! += 1
            case AnimalType.rabbit:
                animalsDictionary[AnimalType.rabbit]! += 1
            default:
                animalsDictionary[AnimalType.turtle]! += 1
            }
        }
        let greatestChoose = animalsDictionary.max { a, b in a.value < b.value }
        
        resultAnimalLabel.text = "Вы - \(greatestChoose?.key.rawValue ?? " ")"
        resultDescriptionLabel.text = greatestChoose?.key.definition
    }
}
