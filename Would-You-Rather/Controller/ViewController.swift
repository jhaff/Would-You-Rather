//
//  ViewController.swift
//  Would-You-Rather
//
//  Created by Jacob Haff on 6/2/20.
//  Copyright © 2020 Jacob Haff. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var quizBrain = QuizBrain()
        
    var questionNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerButtonPressd(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        updateUI()
    }

    func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(resetButtonColor), userInfo: nil, repeats: false)
        
        progressBar.progress = quizBrain.getProgress()
    }
    
    @objc func resetButtonColor() {
               trueButton.backgroundColor = UIColor.clear
               falseButton.backgroundColor = UIColor.clear
           }
}

