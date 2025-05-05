//  WebViewController.swift
//  OctoprintRD
//
//  Created by Johnathan Uptegraph on 10/23/22.

import UIKit
import WebKit
import JavaScriptCore


class LocalViewController: UIViewController, WKUIDelegate {
    
    var jsContext: JSContext!
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var hiddenControllerView: WKWebView!
    @IBOutlet weak var bedTempTextField: UITextField!
    @IBOutlet weak var nozzleTempTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //------------------------Relace with hide------------------------
        displayWebcam()
        hideControllerView()
        // fakeCamViewController()
        // textViewController()
        
    }

// -------------------- Setting Up Views -----------------------------


    func displayWebcam(){
        guard let url = URL(string: "http://octopi.local/webcam/?action=stream") else{print("fail"); return}
        webView.load(URLRequest(url: url))
   }
    
    func hideControllerView(){
        guard let url = URL(string: "http://octopi.local/") else{print("fail"); return}
        hiddenControllerView.load(URLRequest(url: url))
    }

// -------------------- Webpage Practice -----------------------------

    @IBAction func upYButton(_ sender: Any) {
        DispatchQueue.main.asyncAfter(deadline: .now()) {self.hiddenControllerView.evaluateJavaScript("document.getElementById('control-ydec').click();", completionHandler: { (res, error) -> Void in
            print("Up Y")
            //Here you can check for results if needed (res) or whether the execution was successful (error)
        })            }
    }
    
    @IBAction func downYButton(_ sender: Any) {
        DispatchQueue.main.asyncAfter(deadline: .now()) {self.hiddenControllerView.evaluateJavaScript("document.getElementById('control-yinc').click();", completionHandler: { (res, error) -> Void in
            print("Down Y")
            //Here you can check for results if needed (res) or whether the execution was successful (error)
        })            }
    }
    @IBAction func rightXButton(_ sender: Any) {
        DispatchQueue.main.asyncAfter(deadline: .now())
        {self.hiddenControllerView.evaluateJavaScript("document.getElementById('control-xinc').click();", completionHandler: { (res, error) -> Void in
            print("Right X")
            //Here you can check for results if needed (res) or whether the execution was successful (error)
        })            }
    }
    @IBAction func leftXButton(_ sender: Any) {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.hiddenControllerView.evaluateJavaScript("document.getElementById('control-xdec').click();", completionHandler: { (res, error) -> Void in
            print("Left X")
            //Here you can check for results if needed (res) or whether the execution was successful (error)
        })            }
    }
    @IBAction func upZButton(_ sender: Any) {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.hiddenControllerView.evaluateJavaScript("document.getElementById('control-zinc').click();", completionHandler: { (res, error) -> Void in
            print("Up Z")
            //Here you can check for results if needed (res) or whether the execution was successful (error)
        })            }
    }
    @IBAction func downZButton(_ sender: Any) {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.hiddenControllerView.evaluateJavaScript("document.getElementById('control-zdec').click();", completionHandler: { (res, error) -> Void in
            print("Down Z")
            //Here you can check for results if needed (res) or whether the execution was successful (error)
        })            }
    }
    
    
    @IBAction func centerXYButton(_ sender: Any) {
        DispatchQueue.main.asyncAfter(deadline: .now()) {self.hiddenControllerView.evaluateJavaScript("document.getElementById('control-xyhome').click();", completionHandler: { (res, error) -> Void in
            print("X/Y Axis Centered")
            //Here you can check for results if needed (res) or whether the execution was successful (error)
        })            }
    }
    @IBAction func centerZButton(_ sender: Any) {
        DispatchQueue.main.asyncAfter(deadline: .now()) {self.hiddenControllerView.evaluateJavaScript("document.getElementById('control-zhome').click();", completionHandler: { (res, error) -> Void in
            print("Z Axis Centered")
            //Here you can check for results if needed (res) or whether the execution was successful (error)
        })            }
    }
    
    @IBAction func setBedTempButton(_ sender: Any) {
//        DispatchQueue.main.asyncAfter(deadline: .now()) {self.hiddenControllerView.evaluateJavaScript("document.getElementById('ac-gn-menuanchor-open').click();", completionHandler: { (res, error) -> Void in
//            print("clicked")
//            //Here you can check for results if needed (res) or whether the execution was successful (error)
//        }) }
//        DispatchQueue.main.asyncAfter(deadline: .now()+1) {self.hiddenControllerView.evaluateJavaScript("document.getElementById('ac-gn-link-search-small').click();", completionHandler: { (res, error) -> Void in
//            print("In Search Bar")
//            //Here you can check for results if needed (res) or whether the execution was successful (error)
//        }) }
//        DispatchQueue.main.asyncAfter(deadline: .now()+1) {self.hiddenControllerView.evaluateJavaScript("document.getElementById('ac-gn-searchform').click();", completionHandler: { (res, error) -> Void in
//            print("Click Search Bar")
//            //Here you can check for results if needed (res) or whether the execution was successful (error)
//        }) }
//        DispatchQueue.main.asyncAfter(deadline: .now()+3) {self.hiddenControllerView.evaluateJavaScript(".getElementById(\"ac-gn-searchform-input\").innerHTML = \"That's a little cold!\";", completionHandler: { (res, error) -> Void in
//            print("Set Bed Temp:", self.bedTempTextField.text)
//        })}
        print("Set Bed Temp:", self.bedTempTextField.text)
    }
    
    //document.getElementById('ac-gn-searchform-input').innerHTML.replace(100);
        
    @IBAction func setNozzleTempButton(_ sender: Any) {
        print("Set Nozzle Temp:", nozzleTempTextField.text)
    }
    
    //    id="gcode_file_4e507a0023623732dbfa6e6b7140f145"
    
    @IBAction func startPrintButton(_ sender: Any) {
        guard let url = URL(string: "http://octopi.local/") else{print("fail"); return}
        webView.load(URLRequest(url: url))
        DispatchQueue.main.asyncAfter(deadline: .now()+5) {self.hiddenControllerView.evaluateJavaScript("document.getElementById(\"job_print\").click();", completionHandler: { (res, error) -> Void in
                        print("clicked div")
                        //Here you can check for results if needed (res) or whether the execution was successful (error)
                }) }
//                DispatchQueue.main.asyncAfter(deadline: .now()+1) {self.hiddenControllerView.evaluateJavaScript("document.getElementById('ac-gn-searchform').click();", completionHandler: { (res, error) -> Void in
//                    print("Click Search Bar")
//                    //Here you can check for results if needed (res) or whether the execution was successful (error)
//                }) }
//                DispatchQueue.main.asyncAfter(deadline: .now()+3) {self.hiddenControllerView.evaluateJavaScript(".getElementById(\"ac-gn-searchform-input\").innerHTML = \"That's a little cold!\";", completionHandler: { (res, error) -> Void in
//                    print("Set Bed Temp:", self.bedTempTextField.text)
//              })}
        print("Start Print")
    }
    
    @IBAction func stopPrintButton(_ sender: Any) {
        guard let url = URL(string: "http://octopi.local/") else{print("fail"); return}
        webView.load(URLRequest(url: url))
        DispatchQueue.main.asyncAfter(deadline: .now()+5) {self.hiddenControllerView.evaluateJavaScript("document.getElementById(\"job-cancel\").click();", completionHandler: { (res, error) -> Void in
                        print("clicked div")
                        //Here you can check for results if needed (res) or whether the execution was successful (error)
                }) }
    }
    
    @IBAction func tempViewButton(_ sender: Any) {
        guard let url = URL(string: "http://octopi.local/?#temp") else{print("fail"); return}
        webView.load(URLRequest(url: url))
    }
    
    @IBAction func controlViewButton(_ sender: Any) {
        guard let url = URL(string: "http://octopi.local/?#control") else{print("fail"); return}
        webView.load(URLRequest(url: url))
    }
    
    @IBAction func gCodeViewButton(_ sender: Any) {
        guard let url = URL(string: "http://octopi.local/?#gcode") else{print("fail"); return}
        webView.load(URLRequest(url: url))
    }
    @IBAction func termViewButton(_ sender: Any) {
        guard let url = URL(string: "http://octopi.local/?#term") else{print("fail"); return}
        webView.load(URLRequest(url: url))
    }
    @IBAction func timeLapseViewButton(_ sender: Any) {
        guard let url = URL(string: "http://octopi.local//?#timelapse") else{print("fail"); return}
        webView.load(URLRequest(url: url))
    }
    
    @IBAction func webCamViewButton(_ sender: Any) {
        guard let url = URL(string: "http://octopi.local/webcam/?action=stream") else{print("fail"); return}
        webView.load(URLRequest(url: url))
    }
    
}
    
// TEST BOTH VIEWS +
// CLICK BUTTON TO START PRINT
// FIX LOGIN +
// FIX CAMERA
// TEXT FIELD
// RUN MOBILE PHONE


