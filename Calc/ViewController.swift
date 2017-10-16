//
//  ViewController.swift
//  Calc
//
//  Created by Akshay Chandiramani on 24/06/2017.
//  Copyright © 2017 Akshay Chandiramani. All rights reserved.
//

import UIKit

enum modes {
    case not_set
    case addition
    case subtraction
    case multiply
    
}

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
   
    var labelString:String = "0"
    var currentMode:modes = .not_set
    var savedNum:Int = 0
    var lastButtonWasMode:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func didPressPlus(_ sender: Any) {
        if lastButtonWasMode == false {
            label.text = "+"
            currentMode = .addition
            savedNum = Int(labelString)!
            labelString = "0"
            lastButtonWasMode = true
        }
    }
   
    @IBAction func didPressMinus(_ sender: Any) {
        if lastButtonWasMode == false {
            label.text = "-"
            currentMode = .subtraction
            savedNum = Int(labelString)!
            labelString = "0"
            lastButtonWasMode = true
        }
    }
    
    @IBAction func didPressMultiply(_ sender: Any) {
        if lastButtonWasMode == false {
            label.text = "*"
            currentMode = .multiply
            savedNum = Int(labelString)!
            labelString = "0"
            lastButtonWasMode = true
        }
    }
    
    @IBAction func didPressEquals(_ sender: Any) {
        if (lastButtonWasMode == false) {
            if (currentMode == .addition) {
                var labelInt:Int = Int(labelString)!
                labelInt = labelInt + savedNum
                labelString = "\(labelInt)"
                currentMode = .not_set
                updateText()
            }
            if (currentMode == .subtraction) {
                var labelInt:Int = Int(labelString)!
                labelInt = savedNum - labelInt
                labelString = "\(labelInt)"
                currentMode = .not_set
                updateText()
            }
            if (currentMode == .multiply) {
                var labelInt:Int = Int(labelString)!
                labelInt = savedNum * labelInt
                labelString = "\(labelInt)"
                currentMode = .not_set
                updateText()
            }
        }
    }
    
    @IBAction func didPressClear(_ sender: Any) {
        labelString = "0"
        currentMode = .not_set
        savedNum = 0
        lastButtonWasMode = false
        label.text = "0"
    }
    
    @IBAction func didPressNumber(_ sender: UIButton) {
        lastButtonWasMode = false
        let StringValue:String? = sender.titleLabel?.text
        labelString = labelString.appending(StringValue!)
        updateText()
    }
    
    func updateText() {
        guard let labelInt:Int = Int(labelString) else {
            return //to remove leading zeros
        }
        let formatter:NumberFormatter = NumberFormatter()
        formatter.numberStyle = .decimal
        let num:NSNumber = NSNumber(value: labelInt)
        label.text = formatter.string(from: num)
    }
}

