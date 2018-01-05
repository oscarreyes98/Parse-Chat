//
//  LoginViewController.swift
//  ParseChat
//
//  Created by Oscar Reyes on 1/4/18.
//  Copyright © 2018 Oscar Reyes. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let alertController = UIAlertController(title: "Invalid Credentials", message: "Please check your email or password", preferredStyle: .alert)
    let confirmedController = UIAlertController(title: "Successful Signup", message: "Nice", preferredStyle: .alert)
    
    
    // create an OK action
    let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
        // handle response here.
    }
    
    let OKConfirmed = UIAlertAction(title: "OK", style: .default) { (action) in
        // handle response here.
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        alertController.addAction(OKAction)
        confirmedController.addAction(OKConfirmed)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLoginButton(_ sender: Any) {
        if ( !(emailTextField.text!.isEmpty) && !(passwordTextField.text!.isEmpty)) {
            print ( "if statement")
            
            let user = PFUser()
            user.username = emailTextField.text
            user.password = passwordTextField.text
            
            let userPassword = user.password! as String
            let userUsername = user.username! as String
            
            
            PFUser.logInWithUsername(inBackground: userUsername, password: userPassword) {
                (user: PFUser?, error: Error?) -> Void in
                if user != nil {
                    let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let userVC = mainStoryboard.instantiateViewController(withIdentifier: "ChatViewController") as! ViewController
                    
                    //self.present(userVC, animated: true, completion: nil)
                    
                } else {
                    
                }
            }
            
        } else {
            // add the OK action to the alert controller
            
            present(alertController, animated: true)
            print ( "statement reached")
            
        }
    }
    
    
    @IBAction func onSignUpButton(_ sender: Any) {
        if ( !(emailTextField.text!.isEmpty) && !(passwordTextField.text!.isEmpty)) {
            print(emailTextField.text)
            print(passwordTextField.text)
            
            var user = PFUser()
            user.username = emailTextField.text
            user.password = passwordTextField.text
            user.email = emailTextField.text
            
            user.signUpInBackground {
                (succeeded: Bool, error: Error?) -> Void in
                if let error = error {
                    
                    // let errorString = error.userInfo["error"] as? NSString
                    // Show the errorString somewhere and let the user try again.
                } else {
                    self.present(self.alertController, animated: true)
                    print ( "YAY")
                    
                    // Hooray! Let them use the app now.
                }
            }
            
        } else {
            // add the OK action to the alert controller
            
            present(alertController, animated: true)
            
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
