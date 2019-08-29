//
//  ViewController.swift
//  DKMWODisplayUsingGoogleSignIn
//
//  Created by DHIRAJ KUMAR MASODGI on 14/8/19.
//  Copyright © 2019 DHIRAJ KUMAR MASODGI. All rights reserved.
//

import UIKit
import GoogleSignIn

class ViewController: UIViewController, GIDSignInDelegate, GIDSignInUIDelegate {
   
    

    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btnGoogleSignIn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        btnGoogleSignIn.addTarget(self, action: #selector(signInUsingGoogle(_:)), for: .touchUpInside)
    }
    
    @objc func signInUsingGoogle(_ sender: UIButton){
        if btnGoogleSignIn.title(for: .normal)  ==  "Sign Out"{
            
        GIDSignIn.sharedInstance()?.signOut()
            lblTitle.text=""
            btnGoogleSignIn.setTitle("Google Sign In", for: .normal)
        }
        else
        {
        GIDSignIn.sharedInstance()?.delegate = self as! GIDSignInDelegate
        GIDSignIn.sharedInstance()?.uiDelegate = self as! GIDSignInUIDelegate
            GIDSignIn.sharedInstance()?.signIn()
        }
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!)
    {
        
        if let error = error {
         
            print("We have error during sign in user == \(error.localizedDescription)")
        }
        else
        {
            if let gmailUser = user {
                lblTitle.text = gmailUser.profile.email
                btnGoogleSignIn.setTitle("Sign Out", for: .normal)
                
            }
        }
    }


}

