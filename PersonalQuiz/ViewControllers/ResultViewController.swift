//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 12.02.2024.
//

import UIKit

final class ResultViewController: UIViewController {
    @IBOutlet weak var resultLabelTitle: UILabel!
    @IBOutlet weak var resullLabelDefinition: UILabel!
    
    var result: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        let animal = getAnimal(result);
        updateUI(animal)
    }
    
    @IBAction func doneButtonAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    private func getAnimal(_ answers: [Answer]) -> Animal {
        var animalCount: [Animal: Int] = [:]

        for answer in answers {
            animalCount[answer.animal, default: 0] += 1
        }
        
        let sortedAnimals = animalCount.sorted { $0.value > $1.value }
        
        return sortedAnimals.first?.key ?? .dog
    }
    
    private func updateUI(_ animal: Animal) {
        resultLabelTitle.text = "Вы - \(animal.rawValue)"
        resullLabelDefinition.text = animal.definition
    }
}
