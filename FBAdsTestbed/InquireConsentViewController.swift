//
//  InquireConsentViewController.swift
//  FBAdsTestbed
//
//  This display is intended for granting and revoking consent. In method giveConsent the value stored in MyVariables is used.
//

import UIKit
import FBAudienceNetwork

class InquireConsentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (MyVariables.onLoad) {
            giveConsent(self);
        }
    }


    @IBAction func giveConsent(_ sender: Any) {
        FBAdSettings.setAdvertiserTrackingEnabled(MyVariables.userConsent);
        let alertController = UIAlertController(title: "Give consent", message: "Set content for Advertiser Tracking", preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) {
            (action: UIAlertAction!) in
            // Code in this block will trigger when OK button tapped.
            print("Ok button tapped");
        }
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
