//
//  Controller.swift
//  OctoprintRD
//
//  Created by Johnathan Uptegraph on 11/11/22.
//

import Foundation
import WebKit
import JavaScriptCore

class Controller: UIViewController, WKUIDelegate {
    
    @IBOutlet var localView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // displayWebcam()
        // loadView()
    }
    
    func displayWebcam(){
        // Add this as a subview...
        guard let url = URL(string: "http://octopi.local/webcam/?action=stream") else{print("fail"); return}
        localView.load(URLRequest(url: url))
   }
    
}
