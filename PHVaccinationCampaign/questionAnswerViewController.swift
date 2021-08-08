//
//  questionAnswerViewController.swift
//  PHVaccinationCampaign
//
//  Created by Antoinette Marie Torres on 8/7/21.
//

import UIKit

struct MyQuestionAnswerer {
    
    func responseTo(question: String) -> String {
        let loweredQuestion = question.lowercased()
        
        if loweredQuestion == "What is the current vaccination rate of the Philippines?" {
            return "As of August 8, the vaccination rate of the Philippines is 10%!"
        } else if loweredQuestion.hasPrefix("Hello") {
            return "Hello there! What question do you have for me?"
        } else if loweredQuestion.hasPrefix("Where") {
            return "Check the map for nearby vaccination centers."
        } else if loweredQuestion.hasPrefix("Why") {
            return "Getting vaccinated has many benefits for you and your family. It will keep lessen your chances of getting sick as well as lessen your symptoms if you happen to get Covid."
        } else {
            return "?"
        }
        
    }
}
