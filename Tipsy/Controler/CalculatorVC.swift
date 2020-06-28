//
//  ViewControler.swift
//  Tipsy
//
//  Created by Tomasz Jaeschke on 28/06/2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorVC: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctBtn: UIButton!
    @IBOutlet weak var tenPctBtn: UIButton!
    @IBOutlet weak var twentyPctBtn: UIButton!
    @IBOutlet weak var splitNumberLbl: UILabel!
    @IBOutlet weak var splitStepper: UIStepper!

    var tip = TipCalculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        splitNumberLbl.text = "2.0"
        
        splitStepper.value = 2.0
        tip.splitNumber = 2.0
        splitStepper.minimumValue = 1.0
        splitStepper.maximumValue = 12.0
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tap)
    }

    @IBAction func tipChange(_ sender: UIButton) {
        zeroPctBtn.isSelected = false
        tenPctBtn.isSelected = false
        twentyPctBtn.isSelected = false
        
        sender.isSelected = true
        
        tip.PctValue = (Double(sender.currentTitle?.dropLast() ?? "0.0") ?? 0.0) / 100
    }
    
    @IBAction func stepperValueChange(_ sender: UIStepper) {
        splitNumberLbl.text = String(splitStepper.value)
        tip.splitNumber = Double(splitStepper.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        tip.billValue = Double(billTextField.text ?? "0.0") ?? 0.0
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
        print("Bill val: \(tip.getBillValue())")
        print("Bill val per person: \(tip.getBillValuePerPerson())")
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResoultVC
            destinationVC.describeText = "Split between \(tip.splitNumber) people, with \(tip.PctValue * 100)% tip."
            destinationVC.valuePerPerson = tip.getBillValuePerPerson()
        }
    }
}

