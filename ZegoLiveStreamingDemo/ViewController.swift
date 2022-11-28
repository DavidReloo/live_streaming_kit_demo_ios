//
//  ViewController.swift
//  ZegoLiveStreamingDemo
//
//  Created by zego on 2022/11/14.
//

import UIKit
import ZegoUIKitSDK
import ZegoUIKitPrebuiltLiveStreaming

class ViewController: UIViewController {
    
    let appID: UInt32 = Your app id
    let appSign: String = "Your app sign"
    
    @IBOutlet weak var liveIDTextField: UITextField! {
        didSet {
            let liveID: UInt32 = arc4random() % 999999
            liveIDTextField.text = String(format: "%d", liveID)
        }
    }
    
    let userID: String = String(format: "%d", arc4random() % 999999)
    var userName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        userName = String(format: "n_%@", userID)
    }
    
    @IBAction func startLiveButtonClick(_ sender: Any) {
        let config: ZegoUIKitPrebuiltLiveStreamingConfig = ZegoUIKitPrebuiltLiveStreamingConfig(kRoleHost)
        let liveVC: ZegoUIKitPrebuiltLiveStreamingVC = ZegoUIKitPrebuiltLiveStreamingVC.init(appID, appSign: appSign, userID: userID, userName: userName ?? "", liveID: liveIDTextField.text ?? "", config: config)
        liveVC.modalPresentationStyle = .fullScreen
        
        // Add Gift Button
        let giftButton = UIButton(frame: CGRect(x: 0, y: 0, width: 180, height: 80))
        giftButton.setTitle("Gift", for: .normal)
        liveVC.addButtonToBottomMenuBar(giftButton)
        
        
        self.present(liveVC, animated: true, completion: nil)
    }
    
    
    @IBAction func watchLiveButtonClick(_ sender: Any) {
        let config: ZegoUIKitPrebuiltLiveStreamingConfig = ZegoUIKitPrebuiltLiveStreamingConfig(kRoleAudience)
        let liveVC: ZegoUIKitPrebuiltLiveStreamingVC = ZegoUIKitPrebuiltLiveStreamingVC.init(appID, appSign: appSign, userID: userID, userName: userName ?? "", liveID: liveIDTextField.text ?? "", config: config)
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        button.setTitle("test", for: .normal)
        liveVC.addButtonToBottomMenuBar(button)
        liveVC.modalPresentationStyle = .fullScreen
        self.present(liveVC, animated: true, completion: nil)
    }
    
}

