//
//  questionViewController.swift
//  PHVaccinationCampaign
//
//  Created by Antoinette Marie Torres on 8/7/21.
//

import UIKit

class questionViewController: UIViewController {

    @IBOutlet weak var responseLabel: UILabel!
    @IBOutlet weak var askButton: UIButton!
    @IBOutlet weak var questionField: UITextField!
    
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

    @IBAction func askButtonTapped(_ sender: AnyObject) {
        guard questionField.text != nil else {
            return
        }
        questionField.resignFirstResponder()
    }
    
    func displayAnswerTextOnScreen(_ answer: String) {
        responseLabel.text = answer
    }

}

extension questionViewController: UITextFieldDelegate {

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
    
    @IBAction func editingChanged(_ textField: UITextField) {
        guard let text = textField.text else {
            askButton.isEnabled = false
            return
        }
        
        askButton.isEnabled = !text.isEmpty
    }
}

    







