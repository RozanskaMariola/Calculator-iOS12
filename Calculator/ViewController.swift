//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2018.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishTypingNumber: Bool = true
    
    private var displayValue: Double {
        get{
            guard let number = Double(displayLabel.text!) else{
                fatalError("Connot convert display label text to a Double.")
            }
            return number
        }
        set{
            displayLabel.text = String(newValue)
        }
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        isFinishTypingNumber = true
     // jesli nie bedzie mozliwosci wymusic konwersje na Double, podstaw 0
     //   let number = Double(displayLabel.text!)! ?? 0
        

       
        if let calcMethod = sender.currentTitle {
            
            if calcMethod == "+/-" {
              displayValue *= -1//  displayLabel.text = String(displayValue * -1)
            }
            if calcMethod == "AC" {
                displayLabel.text = "0"
            }
            if calcMethod == "%" {
                displayValue /= 100
            }
        }
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        if let numValue =  sender.currentTitle {
            
            if isFinishTypingNumber {
                displayLabel.text = numValue
                isFinishTypingNumber = false
            } else {
                
                if numValue == "." {
                    
                    if displayLabel.text?.contains(".") == true {
                        return
                    }
                    
                    let isInt = floor(displayValue) == displayValue
                    if !isInt {
                        return
                    }
                }
                
                
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }

}

