//
//  Parser.swift
//  OctoprintRD
//
//  Created by Johnathan Uptegraph on 10/23/22.
//

import Foundation
import UIKit
import SwiftUI

struct Parser {
    
    func parse() {
        let api = URL(string: "http://octopi.local/#temp")
            URLSession.shared.dataTask(with: api!) {
                data, response, error in
                if error != nil {
                    print("ERROR: ============================================\n", error?.localizedDescription)
                    return
            }
            do{
                let result = try JSONDecoder().decode(Welcome.self, from: data!)
                
                    print(result)
            } catch {
                // Gets Caught here
                print("fail")
            }
            
        }.resume()
    }


    func testParse(){
        let url = URL(string: "http://octopi.local/")!
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            print(String(data: data, encoding: .utf8)!)
        }
        
        task.resume()
    }
    
    func openWebsite(){
        if let url = URL(string: "http://octopi.local/#temp"),
                UIApplication.shared.canOpenURL(url) {
                    UIApplication.shared.open(url, options: [:])
        }
    }
    
}

