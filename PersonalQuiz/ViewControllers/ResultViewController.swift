//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 07.08.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    
    @IBOutlet weak var animalResultLabel: UILabel!
    @IBOutlet weak var descriptionOfResultLabel: UILabel!
    
    var answers: [Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        identifyAnimal()
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    deinit {
        print("\(type(of: self)) has been deallocated")
    }
    
    private func identifyAnimal() {
        var listOfAnimals: [Animal: Int] = [:]
        var newAnimals: [Animal] = []
        
        for answer in answers {
            newAnimals.append(answer.animal)
        }
        
        for newAnimal in newAnimals {
            listOfAnimals[newAnimal, default: 0] += 1
        }
        
        let sortingAllAnimals = listOfAnimals.sorted(by: {$0.value < $1.value} )
        guard let resultAnimal = sortingAllAnimals.last?.key else { return }
        
        getResult(animal: resultAnimal)
    }
    
    private func getResult(animal: Animal) {
        animalResultLabel.text = "Вы - \(animal.rawValue)!"
        descriptionOfResultLabel.text = animal.definition
    }
}
