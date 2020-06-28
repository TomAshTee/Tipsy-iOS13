//
//  ResoultVC.swift
//  Tipsy
//
//  Created by Tomasz Jaeschke on 28/06/2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResoultVC: UIViewController {

    @IBOutlet weak var describeLbl: UILabel!
    @IBOutlet weak var valuePerPersonLbl: UILabel!
    
    var describeText = ""
    var valuePerPerson: Double = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()

        describeLbl.text = describeText
        valuePerPersonLbl.text = String(format: "%.1f", valuePerPerson)
    }
  
    @IBAction func RecalculateBtnPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
