//
//  QuizBrain.swift
//  Would-You-Rather
//
//  Created by Jacob Haff on 6/3/20.
//  Copyright © 2020 Jacob Haff. All rights reserved.
//

import Foundation

struct QuizBrain {
    let quiz = [
        Question(text: "a dog barks", answer: "True"),
        Question(text: "a cow moos", answer: "True"),
        Question(text: "a cat growls", answer: "False")
    ]
    
    var questionNumber = 0
    
    func checkAnswer(_ userAnswer: String) -> Bool {
        return userAnswer == quiz[questionNumber].answer
    }
    
    mutating func nextQuestion() {
        if questionNumber < quiz.count - 1 {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
    }
    
    func getQuestionText() -> String {
        return quiz[questionNumber].text
    }
    
    func getProgress() -> Float {
        return Float(questionNumber) / Float(quiz.count - 1)
    }
    
}
