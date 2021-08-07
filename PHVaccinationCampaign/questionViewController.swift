//
//  questionViewController.swift
//  PHVaccinationCampaign
//
//  Created by Antoinette Marie Torres on 8/7/21.
//

import UIKit

class questionViewController: UIViewController {
    
    @IBOutlet weak var responseLabel: UILabel!
    @IBOutlet weak var questionField: UITextField!
    @IBOutlet weak var askButton: UIButton!
    
    let questionAnswerer = MyQuestionAnswerer()

    override func viewDidLoad() {
        super.viewDidLoad()
        questionField.becomeFirstResponder()
    }

    func respondToQuestion(_ question: String) {
        let answer = questionAnswerer.responseTo(question: question)

        displayAnswerTextOnScreen(answer)
        questionField.placeholder = "Ask another question..."
        questionField.text = nil
        askButton.isEnabled = false
    }
    
    @IBAction func askButtonTapped(_ sender: Any) {
        guard questionField.text != nil else {
            return
        }
        questionField.resignFirstResponder()
    }
    
    func displayAnswerTextOnScreen(_ answer: String) {
        responseLabel.text = answer
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else {
            return
        }
        
        respondToQuestion(text)
    }
    
    @IBAction func editingChanged(_ sender: UITextField) {
        guard let text = questionField.text else {
            askButton.isEnabled = false
            return
        }
                
            askButton.isEnabled = !text.isEmpty
        }
}
    







