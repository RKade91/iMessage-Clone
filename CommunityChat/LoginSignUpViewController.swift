//
//  LoginSignUpViewController.swift
//  CommunityChat
//
//  Created by Rohit Kumar on 31/12/14.
//  Copyright (c) 2014 Training. All rights reserved.
//

import UIKit

class LoginSignUpViewController:PFLogInViewController, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate {
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        //self.signUpController.delegate = self
        
        self.logInView.logo = UIImageView(image: UIImage(named: "logo"))
        //self.signUpController.signUpView.logo = UIImageView(image: UIImage(named: "logo"))
        
        self.logInView.logo.contentMode = .Center
        //self.signUpController.signUpView.logo.contentMode = UIViewContentMode.Center
        
        self.logInView.signUpButton.removeTarget(self, action: nil, forControlEvents: .AllEvents)
        
        self.logInView.signUpButton.addTarget(self, action: "displaySignUp", forControlEvents: .TouchUpInside)
        
        if PFUser.currentUser() != nil {
            showChatOverview()
        }
        
        
    }
    
    
    func logInViewController(logInController: PFLogInViewController!, didLogInUser user: PFUser!) {
        
        let installation = PFInstallation.currentInstallation()
        installation["user"] = PFUser.currentUser()
        installation.saveInBackgroundWithBlock(nil)
        
        showChatOverview()
    }
    
    
    /*func signUpViewController(signUpController: PFSignUpViewController!, didSignUpUser user: PFUser!) {
        signUpController.dismissViewControllerAnimated(true, completion: { () -> Void in
            let installation = PFInstallation.currentInstallation()
            installation["user"] = PFUser.currentUser()
            installation.saveInBackgroundWithBlock(nil)
            self.showChatOverview()
        })
    }*/
    
    
    func showChatOverview() {
    
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        let overviewVC = sb.instantiateViewControllerWithIdentifier("ChatOverviewVC") as! OverviewTableViewController
        
        overviewVC.navigationItem.setHidesBackButton(true, animated: false)
        
        self.navigationController?.pushViewController(overviewVC, animated: true)
        
    }
    
    func displaySignUp() {
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        let signUpVC = sb.instantiateViewControllerWithIdentifier("SignUpVC") as! SignUpTableViewController
        
        
        self.navigationController?.pushViewController(signUpVC, animated: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}
