//
//  ViewController.swift
//  BullsEye
//
//  Created by kchdully on 01/04/2019.
//  Copyright © 2019 kchdully. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    var currentValue: Int = 50
    var targetValue = 0
    var score = 0
    var round = 0
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    @IBAction func touchNext(_ sender: Any) {
        hit()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        score = 0
        round = 0
        startNewRound()
    }
    
    func hit(){
        let difference = abs(targetValue - currentValue)
        
        var points = 100 - difference
        let title: String
        if difference == 0 {
            title = "Perfect!"
            points += 100
        } else if difference < 5 {
            title = "You almost had it!"
            if difference == 1 {
                points += 50
            }
        } else if difference < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }
        
        score += points
        
        let message = "You scored \(points) points"
    
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        /* For Closure */
        let action = UIAlertAction(title: "O.K", style: .default,
                                   handler: { _ in
                                    self.startNewRound()
        })
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func startNewRound() {
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    func updateLabels() {
        titleLabel.text = String(targetValue)
        scoreLabel.text = "score: \(score)"
        roundLabel.text = "round: \(round)"
    }

}

