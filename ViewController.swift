//
//  ViewController.swift
//  OctoprintRD
//
//  Created by Johnathan Uptegraph on 10/23/22.
//

import UIKit
import SwiftUI

var username = ""
var password = ""

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var usernameLabel: UITextField!
    @IBOutlet var passwordLabel: UITextField!
    @IBOutlet var errorLabel: UILabel!
    @IBOutlet var localButtonOutlet: UIButton!
    @IBOutlet var orButtonOutlet: UILabel!
    @IBOutlet var webButtonOutlet: UIButton!
    @IBOutlet var rememberMeButtonOutlet: UIButton!
    
    let userDefaults = UserDefaults.standard
    let USERNAME_KEY = "usernameKey"
    let PASSWORD_KEY = "passwordKey"
    
    @IBAction func loginButton(_ sender: Any) {
        checkForUserPass()
    }
    
    func checkForUserPass() {
        if (usernameLabel.text == "Username" || usernameLabel.text == ""){
            errorLabel.text = "Enter Your Username"
            hideLoginButtons()
        }
        else if (passwordLabel.text == "Password" || passwordLabel.text == ""){
            errorLabel.text = "Enter Your Password"
            hideLoginButtons()
        }
        else {
            showLoginButtons()
            errorLabel.text = ""
        }
    }
    
    

    
    func checkCredentialValidity() -> Bool {
        
        if ((usernameLabel.text == "" || usernameLabel.text == "Username") && (passwordLabel.text != "" || passwordLabel.text != "Password")) {
            errorLabel.text = "Enter Your Username"
            hideLoginButtons()
            return false
        }
        else  if ((usernameLabel.text != "" || usernameLabel.text != "Username") && (passwordLabel.text != "" || passwordLabel.text != "Password")) {
            errorLabel.text = "Enter Your Password"
            hideLoginButtons()
            return false
        }
        else {
            errorLabel.text = "Select Launch Method"
            showLoginButtons()
            return true
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCredentials()
        hideLoginButtons()
        errorLabel.text = "Enter Your Username"
        //usernameLabel.delegate = self
        //passwordLabel.delegate = self
    }

    
    // Store Username & Password
    func hideLoginButtons(){
        self.localButtonOutlet.isHidden = true;
        self.webButtonOutlet.isHidden = true;
        self.orButtonOutlet.isHidden = true;
    }
    
    
    func showLoginButtons(){
        self.localButtonOutlet.isHidden = false;
        self.webButtonOutlet.isHidden = false;
        self.orButtonOutlet.isHidden = false;
    }
    
    
    @IBAction func localButton(_ sender: Any) {
        if(checkCredentialValidity()) {
        checkLocalCredentials()
        //goto localViewController
//        let localvc = LocalViewController(nibName: "LocalViewController", bundle: nil)
//        self.navigationController?.pushViewController(localvc, animated: true)
        }
    }
    
    @IBOutlet var webButton: UIButton!
    @IBAction func webButton(_ sender: Any) {
        if(checkCredentialValidity()) {
        checkLocalCredentials()
        //goto webViewController
//        let webvc = WebViewController(nibName: "WebViewController", bundle: nil)
//        self.navigationController?.pushViewController(webvc, animated: true)
        }
    }
    
    func storeCredentials() {
        // if username and password have not been saved... save it for the first time from the corresponding UILabels
        UserDefaults.standard.set(usernameLabel.text, forKey: USERNAME_KEY)
        UserDefaults.standard.set(passwordLabel.text, forKey: PASSWORD_KEY)
        username = usernameLabel.text!
        password = passwordLabel.text!
        print("Login Stored:", username, password)
        // else pull the user defaults for username and password and insert them into the corresponding UILabels
    }
    
    // Would I need to set up a system to check User Defaults for the last rememberMe
    var rememberMeIsActive = false;
    
    @IBAction func rememberMeButton(_ sender: Any) {
        // rememberMeButtonOutlet.currentImage = Image("checkmark.square.fill")
        if (rememberMeIsActive == false) {
            rememberMeButtonOutlet.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
            rememberMeIsActive = true
            storeCredentials()
        }

        else {
            rememberMeButtonOutlet.setImage(UIImage(systemName: "square"), for: .normal)
            usernameLabel.text = ""
            passwordLabel.text = ""
            rememberMeIsActive = false
        }
    }
    
   
    
    func loadCredentials() {
        if(UserDefaults.standard.object(forKey: USERNAME_KEY) != nil){
            username = userDefaults.string(forKey: USERNAME_KEY)!
        }
        if(UserDefaults.standard.object(forKey: PASSWORD_KEY) != nil){
            password = userDefaults.string(forKey: PASSWORD_KEY)!
        }
        usernameLabel.text = username
        passwordLabel.text = password
    }
    
    
    func checkLocalCredentials(){
        print("User Login Credentials:\nUsername:", username,"\nPassword:", password)
        launchLocalLogin()
    }
    
    func checkWebCredentials(){
        print("User Login Credentials:\nUsername:", username,"\nPassword:", password)
        lauchWebLogin()
    }
    
    let parser = Parser()

    // Controls "webSegue" connection to WebViewController
    
    // Controls "localSegue" connection to LocalViewController
    func launchLocalLogin(){
        if (rememberMeIsActive) {
            storeCredentials()
        }
        
        let controller = storyboard!.instantiateViewController(withIdentifier: "LocalViewController") as! LocalViewController
    }

    func lauchWebLogin(){
        if (rememberMeIsActive) {
            storeCredentials()
        }
        
        let controller = storyboard!.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController

    }
}

  
