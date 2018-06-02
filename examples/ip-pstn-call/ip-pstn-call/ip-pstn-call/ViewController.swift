//
//  ViewController.swift
//  StitchWorkshop
//
//  Created by Eric Giannini on 31/05/18.
//  Copyright © 2018 Nexmo. All rights reserved.
//
import UIKit
import Stitch

class ViewController: UIViewController {
    
    @IBOutlet private var textField: UITextField!
    
    private var call: Call?
    
    // MARK:
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ConversationClient.configuration = Configuration.init(with: .info)
        ConversationClient.instance
            .login(with: "JWT_TOKEN")
            .subscribe()
    }
    
    // MARK:
    // MARK: Action
    @IBAction
    func makeCall() {
        guard let number = textField.text else { return }
        
        ConversationClient.instance.media.callPhone(number, onSuccess: { result in
            self.call = result.call
            
            print("We have just created a call.")
        }) { error in
            print("We have failed to make a call: \(error)")
        }
    }
    
    @IBAction
    func hangup() {
        call?.hangUp(onSuccess: {
            print("We have hung up.")
        })
    }
}
