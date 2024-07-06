//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import Foundation // or the relevant module


class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var questionText: UILabel!
    
    
    var brain = QuizBrain()
    
    
    
    
    @IBOutlet weak var trueButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }


    
    @IBAction func buttonClicked(_ sender: UIButton) {
        let answer = sender.currentTitle!
        
        let isCorrect = brain.checkAnswer(answer)
        
        if isCorrect {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        brain.updateQuestionNumber()
        
        Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    
    @objc func updateUI() {
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        questionText.text = brain.getQuestionText()
        progressBar.progress = brain.getProgress()
    }
    
}

