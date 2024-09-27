//
//  InitialStateViewController.swift
//  FBAdsTestbed
//
//  This file realizes the initial state for the study. An instance of the Facebook SDK is created without configuring any further settings.
//

import UIKit
import FBAudienceNetwork

class InitialStateViewController: UIViewController {
    
    @IBOutlet private var adContainer: UIView!

    private var adView: FBAdView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (MyVariables.onLoad) {
            createObj(self);
        }
    }
    
    @IBAction func createObj(_ sender: Any) {
        let sb = FBAudienceNetworkAds();
        
        let alertController = UIAlertController(title: "Create Object", message: "Create Object with FBAudienceNetworkAds", preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) {
            (action: UIAlertAction!) in
            // Code in this block will trigger when OK button tapped.
            print("Ok button tapped");
        }
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)    }
}
