//
//  cardPopupViewController.swift
//  PHVaccinationCampaign
//
//  Created by Antoinette Marie Torres on 8/7/21.
//

import UIKit

class cardPopupViewController: UIViewController {

    
    @IBOutlet weak var vaxxCard: UILabel!
    var profileViewControllerInstance: profileViewController?

    func showResult () {
         vaxxCard.text = profileViewControllerInstance?.getName()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
