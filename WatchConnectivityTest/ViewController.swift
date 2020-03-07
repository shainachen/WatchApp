//
//  ViewController.swift
//  WatchConnectivityTest
//
//  Created by shaina on 3/7/20.
//  Copyright © 2020 shaina. All rights reserved.
//

import UIKit
import WatchConnectivity
class ViewController: UIViewController, WCSessionDelegate {
    
    var lastMessage: CFAbsoluteTime = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if (WCSession.isSupported()) {
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {

    }

    func sessionDidBecomeInactive(_ session: WCSession) {

    }

    func sessionDidDeactivate(_ session: WCSession) {

    }


}

