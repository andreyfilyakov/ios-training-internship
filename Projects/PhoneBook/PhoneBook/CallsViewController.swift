//
//  CallsViewController.swift
//  PhoneBook
//
//  Created by Andrey Filyakov on 10/12/2018.
//  Copyright © 2018 MyCompany. All rights reserved.
//

import UIKit

class CallsViewController: UITableViewController {
    
    var calls = DataRepository.getCalls()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        calls = DataRepository.getCalls()
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return calls.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CallCell", for: indexPath)

        let call = calls[indexPath.row]
        cell.textLabel?.text = call.contact?.name ?? call.phoneNumber
        
        if let time = call.time {
            let formatter = DateFormatter()
            formatter.dateStyle = .short
            formatter.timeStyle = .short
            cell.detailTextLabel?.text = formatter.string(from: time)
        }
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let call = calls[indexPath.row]
        DataRepository.addCall(phoneNumber: call.phoneNumber!, time: call.time!)
        calls = DataRepository.getCalls()
        tableView.reloadData()
    }

}
