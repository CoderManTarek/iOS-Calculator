//
//  ConverterViewController.swift
//  Conversion Calculator
//
//  Created by Tarek Elbendary on 10/30/20.
//  Copyright © 2020 Tarek Elbendary. All rights reserved.
//

import UIKit

class ConverterViewController: UIViewController {
    
    @IBOutlet weak var unit: UITextField!
    @IBOutlet weak var entryLabel: UITextField!
    
    @IBOutlet weak var resultUnit: UITextField!
    @IBOutlet weak var resultLabel: UITextField!
    var numberArray: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        unit.text = "°F"
        resultUnit.text = "°C"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func numbers(_ sender: UIButton) {
        numberArray.append(sender.tag)
        //entryLabel.text = String(numberArray) + unit
        entryLabel.text = entryLabel.text! + String(sender.tag)
        convert()
        
    }
    
    @IBAction func decimal(_ sender: UIButton) {
        let temp = Double(entryLabel.text!)
        var temp2: Int?
        let isInteger = floor(temp!)
        if isInteger == temp {
            temp2 = Int(temp!)
        }
        if temp2 != nil{
            //integer so decimal is allowed
            entryLabel.text = entryLabel.text! + "."
        }else{
            return
        }
        //entryLabel.text = entryLabel.text! + "."
    }
    
    
    @IBAction func clear(_ sender: UIButton) {
        entryLabel.text = ""
        resultLabel.text = ""
    }
    
    @IBAction func changeSign(_ sender: UIButton) {
        var temp = Double(entryLabel.text!)
        var temp2: Int?
        let isInteger = floor(temp!)
        if isInteger == temp {
            temp2 = Int(temp!)
        }
        if temp2 != nil{
            temp2 = -temp2!
            entryLabel.text = String(temp2!)
        }else{
            temp = -temp!
            entryLabel.text = String(temp!)
        }
        convert()
    }
    
    
    @IBAction func displayActionSheet(_ sender: UIButton) {
        let alert = UIAlertController(title: "Choice", message: "Choose Converter", preferredStyle: UIAlertController.Style.actionSheet)
        alert.addAction(UIAlertAction(title: "Fahrenheit to Celcius", style: UIAlertAction.Style.default, handler: {
            (alertAction) -> Void in
            // handle choice A
            self.unit.text = "°F"
            self.resultUnit.text = "°C"
            self.convert()
            
        }))
        alert.addAction(UIAlertAction(title: "Celcius to Farenheit", style: UIAlertAction.Style.default, handler: {
            (alertAction) -> Void in
            // handle choice B
            self.unit.text = "°C"
            self.resultUnit.text = "°F"
            self.convert()
            
        }))
        alert.addAction(UIAlertAction(title: "Miles to Kilometers", style: UIAlertAction.Style.default, handler: {
            (alertAction) -> Void in
            // handle choice C
            self.unit.text = "m"
            self.resultUnit.text = "km"
            self.convert()
            
        }))
        alert.addAction(UIAlertAction(title: "Kilometers to Miles", style: UIAlertAction.Style.default, handler: {
            (alertAction) -> Void in
            // handle choice D
            self.unit.text = "km"
            self.resultUnit.text = "m"
            self.convert()
            
        }))
        self.present(alert, animated: true, completion: nil)
    }
    func convert(){
        // double or integer?
        if unit.text == "°F"{
            var temp = Double(entryLabel.text!)
            temp = (temp!-32) * (5/9)
            resultLabel.text = String(round(10*temp!)/10)
        }
        if unit.text == "°C"{
            var temp = Double(entryLabel.text!)
            temp = (temp!*(9/5)) + 32
            resultLabel.text = String(round(10*temp!)/10)
        }
        if unit.text == "m"{
            var temp = Double(entryLabel.text!)
            temp = temp! * 1.60934
            resultLabel.text = String(round(10*temp!)/10)
        }
        if unit.text == "km"{
            var temp = Double(entryLabel.text!)
            temp = temp! / 1.60934
            resultLabel.text = String(round(10*temp!)/10)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    var cost = Double("49.95")
}


