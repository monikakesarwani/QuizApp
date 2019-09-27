//
//  ViewController.swift
//  QuizApp
//
//  Created by Anil on 9/11/19.
//  Copyright © 2019 kesarwani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var quizManager = QuizManager()
    
    //connect UIElemets to viewController
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var option1Button: UIButton!
    @IBOutlet weak var option2Button: UIButton!
    @IBOutlet weak var option3Button: UIButton!
    @IBOutlet weak var option4Button: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    
    @IBOutlet weak var answerStatusLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        restart()
        display()
        
    }
    
    func display(){
        quizManager.indexOfSeletedQuestion = quizManager.generateRandomNumber()
        let questionDictionary = quizManager.trivia[quizManager.indexOfSeletedQuestion]
        questionLabel.text = questionDictionary.question
        
        print(questionDictionary.question)
        print(questionDictionary.answer)
        
        option1Button.setTitle(questionDictionary.option1, for: .normal)
       // print(option1Button)
        option2Button.setTitle(questionDictionary.option2, for: .normal)
        option3Button.setTitle(questionDictionary.option3, for: .normal)
        option4Button.setTitle(questionDictionary.option4, for: .normal)
        
        
        option1Button.setTitleColor(.black, for: .normal)
        option2Button.setTitleColor(.black, for: .normal)
        option3Button.setTitleColor(.black, for: .normal)
        option4Button.setTitleColor(.black, for: .normal)
        
        if questionDictionary.ansType == 2 {
            option1Button.isHidden = false
            option2Button.isHidden = false
            option3Button.isHidden = true
            option4Button.isHidden = true
        } else if questionDictionary.ansType == 4{
            option1Button.isHidden = false
            option2Button.isHidden = false
            option3Button.isHidden = false
            option4Button.isHidden = false
        }
        
        
        
        
        
    }


    @IBAction func playAgainButton(_ sender: UIButton) {
        
        
        
    }
    
    
    @IBAction func checkAnswerButton(_ sender: UIButton) {
        
        quizManager.indexOfSeletedQuestion += 1
        

        let selectedQuestionDic = quizManager.trivia[quizManager.indexOfSeletedQuestion]
        print(selectedQuestionDic)
        let isCorrectAnswer = selectedQuestionDic.answer
        print(isCorrectAnswer)
        let button = sender.currentTitle
        //print(button)
        
        if sender.tag == isCorrectAnswer{
            answerStatusLabel.text = "Correct"
        } else {
            answerStatusLabel.text = "Wrong"
        }
        
        
        
        
    }
    
    
    func restart()  {
        playAgainButton.isHidden = true
        
    }
}

