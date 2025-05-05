//
//  WebViewController.swift
//  OctoprintRD
//
//  Created by Johnathan Uptegraph on 10/23/22.

import UIKit
import WebKit
import JavaScriptCore

class WebViewController: UIViewController, WKUIDelegate {
    
    var jsContext: JSContext!
    var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        login()
        // launchControlView()
        // launchGCodeView()
        // launchTerminalView()
        // launchTimeLapseView()
        // let myURL = URL(string:"http://octopi.local/login/")
    }
    
    func login(){

        guard let url = URL(string: "http://octopi.local/login/") else{print("fail"); return}
            webView.load(URLRequest(url: url))
            //  print("User Login Credentials:\nUsername:", username,"\nPassword:", password)
            // Replaces Username Text Field
            DispatchQueue.main.asyncAfter(deadline: .now()+2) {self.webView.evaluateJavaScript("document.getElementById('login-user').value = '\(username)';", completionHandler: { (res, error) -> Void in
               //print(username)
            })            }
            
            // Replaces Password Text Field
            DispatchQueue.main.asyncAfter(deadline: .now()+2) {self.webView.evaluateJavaScript("document.getElementById('login-password').value = '\(password)';", completionHandler: { (res, error) -> Void in
               // print(password)
            })            }
        
            rememberMe()
        
            // Clicj button to Login
            DispatchQueue.main.asyncAfter(deadline: .now()+3) {self.webView.evaluateJavaScript("document.getElementById('login-button').click();", completionHandler: { (res, error) -> Void in
                print("Button Clicked")
                //Here you can check for results if needed (res) or whether the execution was successful (error)
            })            }
        
            // If the "remember me button from the other page is clicked" call rememberMe().

    }
    
    func rememberMe(){
        DispatchQueue.main.asyncAfter(deadline: .now()+2) {self.webView.evaluateJavaScript("document.getElementById('login-remember').click();", completionHandler: { (res, error) -> Void in
            print("Remember Me")
            //Here you can check for results if needed (res) or whether the execution was successful (error)
        })            }
    }


    func launchControlView(){
            // Replaces Username Text Field
            guard let url = URL(string: "http://octopi.local/?#control") else{print("fail"); return}
            webView.load(URLRequest(url: url))
            // Click Button to Login
            // DispatchQueue.main.asyncAfter(deadline: .now()+5) {self.webView.evaluateJavaScript("document.getElementById('login-button').click();", completionHandler: { (res, error) -> Void in
            // print("Button Clicked")
                //Here you can check for results if needed (res) or whether the execution was successful (error)
            // })            }
    }

    func launchGCodeView(){
            login()
            // Replaces Username Text Field
            guard let url = URL(string: "http://octopi.local/?#gcode") else{print("fail"); return}
            webView.load(URLRequest(url: url))
            // Click Button to Login
            // DispatchQueue.main.asyncAfter(deadline: .now()+5) {self.webView.evaluateJavaScript("document.getElementById('login-button').click();", completionHandler: { (res, error) -> Void in
            // print("Button Clicked")
                //Here you can check for results if needed (res) or whether the execution was successful (error)
            // })            }
    }

    func launchTerminalView(){
            //login()
            // Replaces Username Text Field
            guard let url = URL(string: "http://octopi.local/?#term") else{print("fail"); return}
            webView.load(URLRequest(url: url))
            // Click Button to Login
            // DispatchQueue.main.asyncAfter(deadline: .now()+5) {self.webView.evaluateJavaScript("document.getElementById('login-button').click();", completionHandler: { (res, error) -> Void in
            // print("Button Clicked")
                //Here you can check for results if needed (res) or whether the execution was successful (error)
            // })            }
    }
    
    func launchTimeLapseView(){
            //login()
            // Replaces Username Text Field
            guard let url = URL(string: "http://octopi.local/?#timelapse") else{print("fail"); return}
            webView.load(URLRequest(url: url))
            // Click Button to Login
            // DispatchQueue.main.asyncAfter(deadline: .now()+5) {self.webView.evaluateJavaScript("document.getElementById('login-button').click();", completionHandler: { (res, error) -> Void in
            // print("Button Clicked")
                //Here you can check for results if needed (res) or whether the execution was successful (error)
            // })            }
    }
    
    func displayWebcam(){
        // Add this as a subview...
        guard let url = URL(string: "http://octopi.local/webcam/?action=stream") else{print("fail"); return}
        webView.load(URLRequest(url: url))
   }
}
    
    
//    var jsContext: JSContext!
//
//    var webView : WKWebView = {
//        let prefs = WKWebpagePreferences()
//        prefs.allowsContentJavaScript = true
//        let configuration = WKWebViewConfiguration()
//        let webView = WKWebView(frame: .zero, configuration: configuration)
//        return webView
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        loginCredentials()
//        login()
//        view.addSubview(webView)
//        // togglePrinterRemote()
//    }
//
//    func loginCredentials() {
//        print("User Login Credentials:\nUsername:", username,"\nPassword:", password)
//    }
//
//    // Login to OctoPrint
//    func login(){
//        guard let url = URL(string: "http://octopi.local/login/") else{print("fail"); return}
//            webView.load(URLRequest(url: url))
//            DispatchQueue.main.asyncAfter(deadline: .now()+2) {self.webView.evaluateJavaScript("document.getElementById('login-user').value = '\(username)';", completionHandler: { (res, error) -> Void in
//               print(username)
//            })            }
//            //Here you can check for results if needed (res) or whether the execution was successful (error)
//            DispatchQueue.main.asyncAfter(deadline: .now()+2) {self.webView.evaluateJavaScript("document.getElementById('login-password').value = '\(password)';", completionHandler: { (res, error) -> Void in
//               print(password)
//            })            }
//
//            // Clicks Button
//            DispatchQueue.main.asyncAfter(deadline: .now()+2) {self.webView.evaluateJavaScript("document.getElementById('login-button').click();", completionHandler: { (res, error) -> Void in
//                print("Button Clicked")
//                //Here you can check for results if needed (res) or whether the execution was successful (error)
//            })            }
//    }
//
//    // Switch to Octopi Control
//    func togglePrinterRemote() {
//        login()
//        guard let url = URL(string: "http://octopi.local/#control") else {
//            return
//        }
//        DispatchQueue.main.asyncAfter(deadline: .now()+2) {self.webView.evaluateJavaScript("document.getElementById('login-button').click();", completionHandler: { (res, error) -> Void in
//            print("Button Clicked")
//            //Here you can check for results if needed (res) or whether the execution was successful (error)
//        })            }
//        webView.load(URLRequest(url: url))
//    }
//
//    // To implement future features on other tabs simply change url to the coresponding tab... i.e. http://octopi.local/#gcode
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        webView.frame = view.bounds
//    }
//
//}
