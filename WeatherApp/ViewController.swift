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
            
            label.text = "In " + textField.text! + " is blablabla "
            
        }
        
    }
    
    
    @IBOutlet weak var label: UILabel!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

