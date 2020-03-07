//
//  InterfaceController.swift
//  WatchConnectivityTest WatchKit Extension
//
//  Created by shaina on 3/7/20.
//  Copyright © 2020 shaina. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class InterfaceController: WKInterfaceController, WCSessionDelegate {
    
    @IBOutlet weak var messageLabelText: WKInterfaceLabel!
    @IBOutlet weak var doneButton: WKInterfaceButton!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        if WCSession.isSupported() {
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        // Display message on watch
        let text = message["message"] as! String
        messageLabelText.setText(text)
       
        // Watch device buzzes when message received
        WKInterfaceDevice().play(.click)
    }
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
    }

}
