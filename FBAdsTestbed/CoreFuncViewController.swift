//
//  CoreFuncViewController.swift
//  FBAdsTestbed
//
//  This display uses the core functionality of Amplitude. In this case, showing a banner ad.
//

import UIKit
import FBAudienceNetwork

class CoreFuncViewController: UIViewController, FBAdViewDelegate {
    
    @IBOutlet private var adContainer: UIView!
    
    private var adView: FBAdView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Core func");
        if (MyVariables.onLoad) {
            let adView = FBAdView(placementID: MyVariables.placementId, adSize: kFBAdSizeHeight50Banner, rootViewController: self)
            adView.frame = CGRect(x: 0, y: 0, width: 320, height: 250)
            adView.delegate = self
            adView.loadAd()
            print("Loading FB AD");
            self.adView = adView;
            self.adContainer.addSubview(adView);
        }
    }
    @IBAction func showBannerAd(_ sender: Any) {
        self.adContainer.backgroundColor = UIColor.blue;
        print(MyVariables.placementId);
        let adView = FBAdView(placementID: MyVariables.placementId, adSize: kFBAdSizeHeight50Banner, rootViewController: self)
        adView.frame = CGRect(x: 0, y: 0, width: 320, height: 250)
        adView.delegate = self
        adView.loadAd();
        print("Loading FB AD");
        self.adView = adView
        self.adContainer.addSubview(adView);
    }
    
    func adView(_ adView: FBAdView, didFailWithError error: Error) {
      print("Ad failed to load with error: \(error.localizedDescription)")
        let alertController = UIAlertController(title: "Facebook Error", message: "Ad failed to load with error: \(error.localizedDescription)", preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) {
            (action: UIAlertAction!) in
            // Code in this block will trigger when OK button tapped.
            print("Ok button tapped");
        }
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }

    func adViewDidLoad(_ adView: FBAdView) {
      print("Ad was loaded and ready to be displayed")
      showAd()
    }

    private func showAd() {
      guard let adView = adView, adView.isAdValid else {
        return
      }
      adContainer.addSubview(adView)
    }
}
