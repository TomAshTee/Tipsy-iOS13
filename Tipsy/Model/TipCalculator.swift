//
//  TipCalculator.swift
//  Tipsy
//
//  Created by Tomasz Jaeschke on 28/06/2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct TipCalculator {
    
    var PctValue: Double = 0.1
    var Value: Double = 0.0
    var billValueForPerson: Double = 0.0
    var splitNumber: Double = 2.0
    var billValue: Double = 0.0
    var billEndValue: Double = 0.0
    
    mutating func getBillValuePerPerson() -> Double {
        
        self.billValueForPerson = self.getBillValue() / splitNumber
        return self.billValueForPerson
    }
    mutating func getBillValue() -> Double {
        
        self.Value = self.billValue * self.PctValue
        self.billEndValue = self.billValue + self.Value
        return billEndValue
    }
}
