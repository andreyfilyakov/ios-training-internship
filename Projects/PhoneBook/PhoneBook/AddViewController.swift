//
//  AddViewController.swift
//  PhoneBook
//
//  Created by Andrey Filyakov on 10/12/2018.
//  Copyright © 2018 MyCompany. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    @IBAction func save(_ sender: Any) {
        if let name = nameTextField.text, let phone = phoneNumberTextField.text {
            DataRepository.addContact(name: name, phoneNumber: phone)
            navigationController?.popViewController(animated: true)
        }
    }

}
