//
//  ViewController.swift
//  parseChat
//
//  Created by Shreyas Tawre on 2/23/17.
//  Copyright © 2017 Shreyas Tawre. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    @IBAction func signupPressed(_ sender: Any) {
        let user = PFUser()
        user.username = emailText.text
        user.password = passwordText.text
        // other fields can be set just like with PFObject
        
        user.signUpInBackground()
    }
    
    @IBAction func loginPressed(_ sender: Any) {
        
        PFUser.logInWithUsername(inBackground: emailText.text!, password: passwordText.text!)
        
        
    }
    

}

