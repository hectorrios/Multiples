//
//  ViewController.swift
//  Multiples
//
//  Created by Hector Rios on 09/02/16.
//  Copyright © 2016 mosby. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var multiplesTextField: UITextField!
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var messageLbl: UILabel!
    @IBOutlet weak var addBtn: UIButton!
    
    //MARK: Properties
    var runningSum: Int = 0
    var multipleVal: Int = 0
    let START_MESSAGE = "Press Add to add!"
    let MAX_CALCULATIONS = 10
    var numberOfCalculations = 0
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: IBActions
    
    @IBAction func onPlayBtnPressed(sender: UIButton) {
        if multiplesTextField.text != nil && !multiplesTextField.text!.isEmpty {
            
            if  (Int(multiplesTextField.text!) != nil) {
                
                self.multipleVal = Int(multiplesTextField.text!)!
                
                //Prepare to play
                self.logoImage.hidden = true
                self.playBtn.hidden = true
                self.multiplesTextField.hidden = true
                
                self.addBtn.hidden = false
                self.messageLbl.hidden = false
            }
            
        }
    }
    

    @IBAction func onAddBtnPressed(sender: UIButton) {
        
        if (numberOfCalculations < self.MAX_CALCULATIONS) {
            let currentRunningSum = self.runningSum
            self.runningSum += self.multipleVal
            
            let equation: String = "\(currentRunningSum) + \(multipleVal) = \(runningSum)"
            
            self.messageLbl.text = equation
            self.numberOfCalculations++
        } else {
            //Reset the Game
            //Prepare to play
            self.logoImage.hidden = false
            self.playBtn.hidden = false
            self.multiplesTextField.text = ""
            self.multiplesTextField.hidden = false
            
            self.addBtn.hidden = true
            self.messageLbl.text = self.START_MESSAGE
            self.messageLbl.hidden = true
            
            self.multipleVal = 0
            self.runningSum = 0
            self.numberOfCalculations = 0
        }
        
    }

}

