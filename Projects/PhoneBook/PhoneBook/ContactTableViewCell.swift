//
//  ContactTableViewCell.swift
//  PhoneBook
//
//  Created by Andrey Filyakov on 10/12/2018.
//  Copyright © 2018 MyCompany. All rights reserved.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    var contact: Contact! {
        didSet {
            nameLabel.text = contact.name
        }
    }

    @IBAction func call(_ sender: Any) {
        DataRepository.addCall(phoneNumber: contact.phoneNumber ?? "", time: Date())
    }
    
}
