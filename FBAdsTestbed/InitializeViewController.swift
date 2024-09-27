//
//  InitializeViewController.swift
//  FBAdsTestbed
//
//  This display enables the Facebook SDK to be initialized.
//

import UIKit
import FBAudienceNetwork

class InitializeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Initialize");
        if (MyVariables.onLoad) {
            initSDK();
        }
    }
    
    @IBAction func initSDKViaButton(_ sender: Any) {
        initSDK();
        let alertController = UIAlertController(title: "Initialize SDK", message: "Initialize FBAudience Network ADs", preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) {
            (action: UIAlertAction!) in
            // Code in this block will trigger when OK button tapped.
            print("Ok button tapped");
        }
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func initSDK() {
        FBAudienceNetworkAds.initialize(with: nil, completionHandler: nil)
    }
}
