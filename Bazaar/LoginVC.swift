//
//  LoginVC.swift
//  Bazaar
//
//  Created by AVIN on 2017-10-11.
//  Copyright © 2017 Syed Abbas. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class LoginVC: UIViewController, GIDSignInUIDelegate {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var signInButton: GIDSignInButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //emailField.delegate = self
        //passwordField.delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signIn()
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func googleSignInBtnWasPressed(_ sender: Any) {
        
    }
   
    @IBAction func signInBtnWasPressed(_ sender: Any) {
        if emailField.text != nil && passwordField.text != nil {
            AuthService.instance.loginUser(withEmail: emailField.text!, andPassword: passwordField.text!, loginComplete: { (sucess, loginError) in
                if sucess {
                    //Sucessfully login
                    print("Sucessfully loged In")
                } else {
                    //Could not login
                    print(String( describing: loginError?.localizedDescription))
                }
                
                AuthService.instance.registerUser(withEmail: self.emailField.text!, andPassword: self.passwordField.text!, userCreationComplete: { (sucess, registerError) in
                    if sucess{
                        AuthService.instance.loginUser(withEmail: self.emailField.text!, andPassword: self.passwordField.text! , loginComplete: { (sucess, nil) in
                            print("Sucessfully registered user")
                            self.dismiss(animated: true, completion: nil)
                        })
                    } else {
                        print(String(describing: registerError?.localizedDescription))
                    }
                })
            })
        }
    }
    
    
  //  extension LoginVC: UITextFieldDelegate{
        
   // }

}
