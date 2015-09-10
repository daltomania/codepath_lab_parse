//
//  LoginViewController.swift
//  lab_parse
//
//  Created by Will Dalton on 9/9/15.
//  Copyright (c) 2015 daltomania. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBAction func loginAction(sender: AnyObject) {
        signin()
    }
    
    @IBAction func signupAction(sender: AnyObject) {
        signup()
    }
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        if PFUser.currentUser() != nil {
            self.performSegueWithIdentifier("firstSegue", sender: self)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func signup() {
        var user = PFUser()
        user.username = usernameField.text
        user.password = passwordField.text
        
        user.signUpInBackgroundWithBlock {
            (succeeded: Bool, error: NSError?) -> Void in
            if let error = error {
                let errorString = error.userInfo?["error"] as? NSString
                // Show the errorString somewhere and let the user try again.
                println(errorString)
            } else {
                println("signup success")
                self.performSegueWithIdentifier("firstSegue", sender: self)
            }
        }
    }
    
    func signin() {
        let username = usernameField.text
        let password = passwordField.text

        PFUser.logInWithUsernameInBackground(username, password: password) {
            (user: PFUser?, error: NSError?) -> Void in
            if user != nil {
                // Do stuff after successful login.
                println("login success")
                self.performSegueWithIdentifier("firstSegue", sender: self)
            } else {
                // The login failed. Check error to see why.
                if let error = error {
                    let errorString = error.userInfo?["error"] as? NSString
                    println("signin error")
                    println(errorString)
                }
            }
        }
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
