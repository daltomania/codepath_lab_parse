//
//  ChatViewController.swift
//  lab_parse
//
//  Created by Will Dalton on 9/9/15.
//  Copyright (c) 2015 daltomania. All rights reserved.
//

import UIKit
import Parse

class ChatViewController: UIViewController {

    @IBOutlet weak var chatTextField: UITextField!
    
    @IBAction func sendChat(sender: AnyObject) {
        let chatText = chatTextField.text
        var message = PFObject(className: "Message")
        message["text"] = chatText
        message.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            if (success) {
                println("message creation success")
            } else {
                println("message creation failure")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
