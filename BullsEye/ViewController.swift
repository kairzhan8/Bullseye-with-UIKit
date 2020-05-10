//
//  ViewController.swift
//  BullsEye
//
//  Created by Kairzhan Kural on 5/10/20.
//  Copyright © 2020 Kairzhan Kural. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int = 0
    var targetValue: Int = 0
    var score = 0
    var round = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        startOver()
    }
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var randomTargetValue: UILabel!
    @IBOutlet weak var totalScore: UILabel!
    @IBOutlet weak var currentRound: UILabel!
    
    @IBAction func showAlert() {
      
        let difference = abs(currentValue - targetValue)
        var points = 100 - difference
        
        score += points
        
        let title: String
        if difference == 0 {
            title = "Perfect!"
            points += 100
        } else if difference < 5 {
            title = "You almost had it"
            if difference == 1 {
                points += 50
            }
        } else if difference < 10 {
            title = "Pretty good"
        } else {
            title = "Not even close."
        }
        
        let alert = UIAlertController(title: title, message: "You scored \(points) points", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Awesome", style: .default, handler: {
            action in
            self.startNewRound()
        })
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
    }
    
    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        round += 1
        updateLabels()
    }
    
    func updateLabels() {
        randomTargetValue.text = String(targetValue)
        totalScore.text = String(score)
        currentRound.text = String(round)
    }
    
    @IBAction func startOver() {
        round = 0
        score = 0
        startNewRound()
    }

}

