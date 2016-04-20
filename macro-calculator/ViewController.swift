//
//  ViewController.swift
//  macro-calculator
//
//  Created by Eddie Keller on 4/1/16.
//  Copyright © 2016 Eddie Keller. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var carbsField: UITextField!
    @IBOutlet weak var proteinField: UITextField!
    @IBOutlet weak var fatField: UITextField!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var calcButton: UIButton!
    
    var total: Int!
    var carbsInt: Int? = nil
    var proteinInt: Int? = nil
    var fatsInt: Int? = nil
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        caloriesLabel.text = ""
        calcButton.layer.cornerRadius = 5.0
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    
    func calculateMacros() {
        carbsInt = Int(self.carbsField.text!)
        proteinInt = Int(self.proteinField.text!)
        fatsInt = Int(self.fatField.text!)
        
        total = (carbsInt! * 4) + (proteinInt! * 4) + (fatsInt! * 9)
        
        caloriesLabel.text = "\(total) calories"
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }

    @IBAction func calculateButtonPressed(sender: AnyObject) {
        calculateMacros()
    }
    

}

