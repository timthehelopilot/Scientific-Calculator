//
//  ViewController.swift
//  Scientific Calculator
//
//  Created by Timothy Barrett on 11/19/16.
//  Copyright © 2016 Timothy Barrett. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet var leftStackLeadingConstraint: NSLayoutConstraint!
    @IBOutlet var rightStackLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet var leftStackView: UIStackView!
    
    
    var operatorPressed = 0
    var setZero = true
    var operand = 0.0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    override func viewWillLayoutSubviews() {
        checkOrientation(orientation: UIDevice.current.orientation)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        checkOrientation(orientation: UIDevice.current.orientation)
    }
    
    
    
    @IBAction func numberButtonTapped(_ sender: UIButton) {
        
        if setZero {
            resultLabel.text = "0"
            setZero = false
        }
        
        var result = Double(resultLabel.text!)!
        
        result = result * 10 + Double(sender.tag)
        resultLabel.text = "\(result)"
        
    }

    @IBAction func operatorButtonTapped(_ sender: UIButton) {
        
        if operatorPressed != 0 {
            operand = calculateResult(operate: operatorPressed)
            resultLabel.text = "\(operand)"
            operatorPressed = sender.tag
            setZero = true
        } else {
            
            let result = Double(resultLabel.text!)!
            operand = result
            setZero = true
            operatorPressed = sender.tag
            
        }
        
    }
    
    @IBAction func clearButtonTapped(_ sender: UIButton) {
        
        resultLabel.text = "0"
        
    }
    
    @IBAction func equalButtonTapped(_ sender: UIButton) {
        
        operand = calculateResult(operate: operatorPressed)
        resultLabel.text = "\(operand)"
        operatorPressed = 0
        setZero = true
    }
    
    
    func calculateResult(operate: Int) -> Double {
        
        var returnValue = Double(resultLabel.text!)!
        
        switch operate {
        case 1:
            returnValue = operand * returnValue
        case 2:
            returnValue = operand / returnValue
        case 3:
            returnValue = operand + returnValue
        case 4:
            returnValue = operand - returnValue
        default:
            break
        }
        
        return returnValue
        
    }
    
    
    func checkOrientation(orientation: UIDeviceOrientation) {
        
        if orientation.isPortrait {
            
            leftStackLeadingConstraint.isActive = false
            rightStackLeadingConstraint.isActive = true
            leftStackView.isHidden = true
            
        } else {
            
            leftStackLeadingConstraint.isActive = true
            rightStackLeadingConstraint.isActive = false
            leftStackView.isHidden = false
            
        }
        
        
        
    }
    
    
}

