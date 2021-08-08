//
//  cardPopupViewController.swift
//  PHVaccinationCampaign
//
//  Created by Antoinette Marie Torres on 8/7/21.
//

import UIKit

class cardPopupViewController: UIViewController {
    
    @IBOutlet weak var vaxxCard: UILabel!
    var stringHolder:String = " "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.vaxxCard.text = "Thank you,\(stringHolder)! We now have your vaccination information. Prepare to receive a digital vaccination card soon via email!"
    }

}
