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
    
    let quiz = [
        Question(text: "a dog barks", answer: "True"),
        Question(text: "a cow moos", answer: "True"),
        Question(text: "a cat growls", answer: "False")
    ]
    
    var questionNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerButtonPressd(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle
        let actualAnswer = quiz[questionNumber].answer
        
        if userAnswer == actualAnswer {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        if questionNumber < quiz.count - 1{
            questionNumber += 1
        } else {
            questionNumber = 0
        }
        updateUI()
    }

    func updateUI() {
        questionLabel.text = quiz[questionNumber].text
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(resetButtonColor), userInfo: nil, repeats: false)
        
        progressBar.progress = Float(questionNumber) / Float(quiz.count)
    }
    
    @objc func resetButtonColor() {
               trueButton.backgroundColor = UIColor.clear
               falseButton.backgroundColor = UIColor.clear
           }
}

