//
//  ViewController.swift
//  TableView
//
//  Created by Andrey Filyakov on 16/11/2017.
//  Copyright © 2017 Harman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var countryName: String?
    var continentName: String?
    var isEditMode = true

    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var continentTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        continentTextField.text = continentName
        countryTextField.text = countryName
        
        if !isEditMode {
            countryTextField.isEnabled = false
            continentTextField.isEnabled = false
            addButton.isHidden = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addCountry(_ sender: Any) {
        countryName = countryTextField.text
        continentName = continentTextField.text
        guard let tableController = navigationController?.viewControllers.first as? TableViewController else {
            return
        }
        if tableController.countriesDict[continentName!] != nil {
            tableController.countriesDict[continentName!]?.append(countryName!)
        } else {
            tableController.countriesDict[continentName!] = [countryName!]
        }
        
        tableController.tableView.reloadData()
        navigationController?.popViewController(animated: true)
    }
    
}

