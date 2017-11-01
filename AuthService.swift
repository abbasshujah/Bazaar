//
//  AuthService.swift
//  Bazaar
//
//  Created by AVIN on 2017-10-10.
//  Copyright © 2017 Syed Abbas. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth

class AuthService{
    static let instance = AuthService()
    
    
    /*
        Function for a new user registration. If a user does not exist, create a new user. 
        Auth.auth().createUser() -> method is used to create a new user. If there is an error
        we start executing guard let block.
    */
    
    func registerUser(withEmail email: String, andPassword password: String, userCreationComplete: @escaping
        (_ status:Bool, _ error: Error?) ->()){
        
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            guard let user = user else{
                //If a user could not be created, pass false and return out of the block.
                userCreationComplete(false,error)
                return
            }
            
            let userData = ["provider": user.providerID, "email": user.email]
            DataService.instance.createDBUser(uid: user.uid, userData: userData)
            userCreationComplete(true,nil)
        }
        
    }
    
    
    /*
        Function for loginin user. Use Auth.auth().signIn() to signin a user.
 
     */
    
    
    
    func loginUser(withEmail email: String, andPassword password: String, loginComplete: @escaping
        (_ status:Bool, _ error: Error?) ->()){
        
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if error != nil {
                loginComplete(false,error)
                return
            }
    
            //Login sucessfully completed.
            loginComplete(true,nil)
            
            
        }
        
    }
    
}
