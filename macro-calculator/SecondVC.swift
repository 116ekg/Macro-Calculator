//
//  SecondVC.swift
//  macro-calculator
//
//  Created by Eddie Keller on 4/4/16.
//  Copyright © 2016 Eddie Keller. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {
    
    //Outlets
    @IBOutlet weak var ageField: UITextField!
    @IBOutlet weak var genderField: UITextField!
    @IBOutlet weak var heightField: UITextField!
    @IBOutlet weak var weightField: UITextField!
    @IBOutlet weak var lbsSwitch: UISwitch!
    @IBOutlet weak var calcButton: UIButton!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var freqField: UITextField!
    
    //Vars
    var ageInt: Double!
    var heightInt: Double!
    var weightDouble: Double!
    var totalCals: Double!
    var freqDouble: Double!
    var freqMultiplier: Double!
    
    
    //Functions

    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = ""

        calcButton.layer.cornerRadius = 5.0
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func calorieFormula() {
        ageInt = Double(self.ageField.text!)
        heightInt = Double(self.heightField.text!)
        weightDouble = Double(self.weightField.text!)
        freqDouble = Double(self.freqField.text!)
        
        if freqDouble == 0 {
            freqMultiplier = 1.2
        } else if freqDouble == 1 {
            freqMultiplier = 1.2
        } else if freqDouble == 2 {
            freqMultiplier = 1.375
        } else if freqDouble == 3 {
            freqMultiplier = 1.4
        } else if freqDouble == 4 {
            freqMultiplier = 1.55
        } else if freqDouble == 5 {
            freqMultiplier = 1.6
        } else if freqDouble == 6 {
            freqMultiplier = 1.725
        } else if freqDouble == 7 {
            freqMultiplier = 1.9
        }
        
        if lbsSwitch.on {
            weightDouble = weightDouble / 2.2
        }
        
        if genderField.text == "Male" {
            totalCals = ((weightDouble * 10) + (6.25 * heightInt) - (ageInt * 5) + 5) * freqMultiplier
            totalLabel.text = "\(totalCals)"
        } else if genderField.text == "Female" {
            totalCals = ((weightDouble * 10) + (6.25 * heightInt) - (ageInt * 5) - 161) * freqMultiplier
            totalLabel.text = "\(totalCals)"
        } else {
            totalLabel.text = "Enter Male or Female"
        }
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    //Actions
    
    @IBAction func calcButtonPressed(sender: AnyObject) {
        calorieFormula()
        
    }

}
