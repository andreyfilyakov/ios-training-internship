//
//  TableViewController.swift
//  TableView
//
//  Created by Andrey Filyakov on 16/11/2017.
//  Copyright © 2017 Harman. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var countriesDict = ["Europe": ["Russia", "Germany", "Belgium", "Poland", "France",
                                    "Spain", "Switzerland", "England", "Portugal", "Croatia", "Denmark", "Iceland", "Sweden", "Serbia"],
                         "South America": ["Brazil", "Argentina", "Peru", "Columbia", "Urugway"],
                         "North America": ["Mexico", "Costa-Rica", "Panama"],
                         "Africa": ["Tunisia", "Egypt", "Senegal", "Nigeria", "Marocco"],
                         "Asia": ["Iran", "Australia", "Japan", "South Korea", "Saudi Arabia"]]
    
    var countries = ["Russia", "Germany", "Brazil", "Portugal", "Argentina", "Belgium", "Poland", "France",
                     "Spain", "Peru", "Switzerland", "England", "Columbia", "Mexico", "Urugway", "Croatia",
                     "Denmark", "Iceland", "Costa-Rica", "Sweden", "Tunisia", "Egypt", "Senegal", "Iran",
                     "Serbia", "Nigeria", "Australia", "Japan", "Marocco", "Panama", "South Korea", "Saudi Arabia"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return countriesDict.keys.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = Array(countriesDict.keys)[section]
        return countriesDict[key]!.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath)
        let key = Array(countriesDict.keys)[indexPath.section]
        cell.textLabel?.text = countriesDict[key]?[indexPath.row]
        return cell
    }

    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let key = Array(countriesDict.keys)[indexPath.section]
            
            if countriesDict[key]?.count == 1 {
                countriesDict.removeValue(forKey: key)
                let indexSet = IndexSet(integer: indexPath.section)
                tableView.deleteSections(indexSet, with: .fade)
            } else {
                countriesDict[key]?.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }

    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Array(countriesDict.keys)[section]
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "CountryViewController") as? ViewController
        let key = Array(countriesDict.keys)[indexPath.section]
        controller?.isEditMode = false
        controller?.continentName = key
        controller?.countryName = countriesDict[key]?[indexPath.row]
        show(controller!, sender: self)
    }

}
