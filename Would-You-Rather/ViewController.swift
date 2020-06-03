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
    @IBOutlet weak var falseButtoon: UIButton!
    
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
            print("right")
        } else {
            print("wrong")
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
    }
}

