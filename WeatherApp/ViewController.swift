//
//  ViewController.swift
//  WeatherApp
//
//  Created by Filip on 10.06.2018.
//  Copyright © 2018 Filip. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    
    @IBAction func submitButton(_ sender: Any) {
        
        if (textField?.text?.trimmingCharacters(in: .whitespaces).isEmpty)!{
            
            label.text = "Enter your city."
            
        } else {
            
            if let url = URL(string: "https://www.weather-forecast.com/locations/" + textField.text!.replacingOccurrences(of: " ", with: "-") + "/forecasts/latest") {
                
                let request = NSMutableURLRequest(url: url)
                
                let task = URLSession.shared.dataTask(with: request as URLRequest) {data, response, error in
                    
                    var message = ""
                    
                    if let error = error {
                        
                        print(error)
                        
                    } else {
                        
                        if let unwrappedData = data {
                            
                            let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)
                            
                            var stringSeparator = "<p class=\"b-forecast__table-description-content\"><span class=\"phrase\">"
                            
                            if let content = dataString?.components(separatedBy: stringSeparator) {
                                
                                if content.count > 1 {
                                    
                                    stringSeparator = "</span>"
                                    
                                    let secondContent = content[1].components(separatedBy: stringSeparator)
                                    
                                    if secondContent.count > 1 {
                                        
                                        message = secondContent[0].replacingOccurrences(of: "&deg;", with: "°")
                                        print(message)
                                        
                                    }
                                    
                                }
                                
                                
                            }
                            
                            
                        }
                        
                    }
                    
                    if message == "" {
                        
                        message = "The weather there could't be found. Please try again."
                        
                    }
                    
                    DispatchQueue.main.sync(execute: {
                        
                        self.label.text = message
                        
                    })
                    
                }
                
                task.resume()
                
            } else {
                
                label.text = "The weather there could't be found. Please try again."
                
            }
            
        }
        
    }
    
    
    @IBOutlet weak var label: UILabel!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       /* if let url = URL(string: "https://www.weather-forecast.com/locations/" + textField.text!.replacingOccurrences(of: " ", with: "-") + "/forecasts/latest") {
        
        let request = NSMutableURLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) {data, response, error in
            
            var message = ""
            
            if let error = error {
                
                print(error)
                
            } else {
                
                if let unwrappedData = data {
                    
                    let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)
                    
                    var stringSeparator = "<p class=\"b-forecast__table-description-content\"><span class=\"phrase\">"
                    
                    if let content = dataString?.components(separatedBy: stringSeparator) {
                        
                        if content.count > 1 {
                            
                            stringSeparator = "</span>"
                            
                            let secondContent = content[1].components(separatedBy: stringSeparator)
                            
                                if secondContent.count > 1 {
                                    
                                    message = secondContent[0].replacingOccurrences(of: "&deg;", with: "°")
                                    print(message)
                                
                            }
                            
                        }
                        
                        
                    }
                    
                    
                }
                
            }
        
            if message == "" {
                
                message = "The weather there could't be found. Please try again."
                
            }
            
            DispatchQueue.main.sync(execute: {
                
                self.label.text = message
                
            })
            
        }
        
        task.resume()
            
        } else {
            
            label.text = "The weather there could't be found. Please try again."
            
        }
        */
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

