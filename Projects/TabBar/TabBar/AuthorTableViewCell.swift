//
//  AuthorTableViewCell.swift
//  TabBar
//
//  Created by Andrey Filyakov on 23/11/2017.
//  Copyright © 2017 Harman. All rights reserved.
//

import UIKit

class AuthorTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    
    var addAction: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setAuthor(_ author: Author) {
        nameLabel.text = author.name
        countryLabel.text = author.country
    }
    
    @IBAction func add(_ sender: Any) {
        if addAction != nil {
            addAction!()
        }
        let button = sender as! UIButton
        if button.currentTitle == "Add" {
            button.setTitle("Remove", for: .normal)
        } else {
            button.setTitle("Add", for: .normal)
        }
    }
    
}
