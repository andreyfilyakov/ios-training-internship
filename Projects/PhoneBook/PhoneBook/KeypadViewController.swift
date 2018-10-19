//
//  KeypadViewController.swift
//  PhoneBook
//
//  Created by Andrey Filyakov on 10/12/2018.
//  Copyright © 2018 MyCompany. All rights reserved.
//

import UIKit

class KeypadViewController: UIViewController {
    
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
        DataRepository.addCall(phoneNumber: phoneLabel.text ?? "", time: Date())
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
