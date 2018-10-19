//
//  ViewController.swift
//  Call2
//
//  Created by Andrey Filyakov on 14/11/2017.
//  Copyright © 2017 Harman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet var digitButtons: [UIButton]!
        @IBOutlet weak var clear: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        phoneLabel.text = ""
        clear.isHidden = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // Обратите внимание, что код по скруглению кнопок перенесен из viewDidLoad в viewDidLayoutSubviews, т.к. именно в момент вызова метода viewDidLayoutSubviews свойство frame у всех кнопок представляет собой реальную рамку этих кнопок. В момент вызова метода viewDidLoad свойство frame может иметь непредвиденное значение, что приводит к непредсказуемым результатам. Поэтому нельзя производить вычисления, основанные на размерах и расположениях любых UIView в методе viewDidLoad.
        for button in digitButtons {
            button.layer.cornerRadius = button.frame.width / 2
            button.layer.borderColor = UIColor.black.cgColor
            button.layer.borderWidth = 1
        }
    }
    
    @IBAction func clickDigit(_ sender: Any) {
        let button = sender as! UIButton
        phoneLabel.text?.append((button.titleLabel?.text)!)
        clear.isHidden = false
        
    }
    
    @IBAction func call(_ sender: Any) {
        //TODO: phone call
    }
    
    @IBAction func clear(_ sender: Any) {
        guard var phoneNumber = phoneLabel.text else {
            return
        }
        if phoneNumber.count > 0 {
            phoneNumber.remove(at: phoneNumber.index(before: phoneNumber.endIndex))
            phoneLabel.text = phoneNumber
            
            if phoneNumber.count == 0 {
                clear.isHidden = true
            }
        }
    }
    
}

