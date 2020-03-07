//
//  ViewController.swift
//  WatchConnectivityTest
//
//  Created by shaina on 3/7/20.
//  Copyright © 2020 shaina. All rights reserved.
//

//Project adapted from HackingWithSwift's tutorial: https://www.hackingwithswift.com/read/37/8/communicating-between-ios-and-watchos-wcsession

import UIKit
import WatchConnectivity
class ViewController: UIViewController, WCSessionDelegate {
    @IBOutlet weak var messageTextField: UITextField!
    
    var lastMessage: CFAbsoluteTime = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Setup phone to watch connection
        if (WCSession.isSupported()) {
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
    }
    @IBAction func sendButtonPressed(_ sender: Any) {
        let message = messageTextField.text
        if message == "" {
            sendWatchMessage(message: "testing")
        } else {
            sendWatchMessage(message: message)
        }
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {

    }

    func sessionDidBecomeInactive(_ session: WCSession) {

    }

    func sessionDidDeactivate(_ session: WCSession) {

    }
    
    func sendWatchMessage(message: String!) {
        let currentTime = CFAbsoluteTimeGetCurrent()
        
        // Limit number of messages sent within one second
        if lastMessage + 0.5 > currentTime {
            return
        }

        // Check reachability of the watch: is it running and in foreground?
        if (WCSession.default.isReachable) {
            // Send data in dictionary form with sendMessage() from phone to watch
            let message = ["Message": message]
            WCSession.default.sendMessage(message, replyHandler: nil) { (error) in
                print("Message sending error: ", error.localizedDescription)
            }
        }

        // Update message rate limiting property
        lastMessage = CFAbsoluteTimeGetCurrent()
    }

}

