//
//  ViewController.swift
//  Testproject
//
//  Created by Justin Lindberg on 10/28/19.
//  Copyright © 2019 Justin Lindberg. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseUI


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Time to initialize the database using the reference variable to establish the connection
        
        let ref = Database.database().reference()
        
        
        
        //Time to utilize the setValue method to make the app write value to the database upon startup after (ViewDidLoad)
        
        ref.child("LituationTestID/Name").setValue("Justin Lindberg da legendary programer")
        ref.childByAutoId().setValue(["Name": "Dee", "Age": 20, "Classification": "Junior"])
        
        
        // Do any additional setup after loading the view.
    }
//Time to test the ability to login and authenticate with firebase...
    
    @IBAction func LoginTapped(_ sender: UIButton) {
        //Get the default auth UI object
        let authUI = FUIAuth.defaultAuthUI()
        guard authUI != nil else{
            //logs the error that we dont have the default
            return
        }
        //set ourselves as the delegate
        authUI?.delegate = self
        //get a reference to the auth ui view controller
        let authviewController = authUI!.authViewController()
        //show it
        present(authviewController, animated: true, completion: nil)
    }
    

}

//create an extension for the view controller
extension ViewController: FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        //check if there was an error first
        guard error == nil else {
            //logs the error
            return
        }
        if error != nil {
           // log error
            return
        }
        //Going to help me determing where to send user next after getting id
        //authDataResult?.user.uid
        performSegue(withIdentifier: "goHome", sender: self)
    }
    
}
