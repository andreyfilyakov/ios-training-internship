//
//  FavouritesViewController.swift
//  TabBar
//
//  Created by Andrey Filyakov on 23/11/2017.
//  Copyright © 2017 Harman. All rights reserved.
//

import UIKit

class FavouritesViewController: UITableViewController {

    var books = [Book]()
    var authors = [Author]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addAuthor(_ author: Author) {
        if !authors.contains(where: {$0 === author}) {
            authors.append(author)
        } else {
            let index = authors.index(where: {$0 === author})
            authors.remove(at: index!)
        }
        tableView.reloadData()
    }
    
    func addBook(_ book: Book) {
        if !books.contains(where: {$0 === book}) {
            books.append(book)
        } else {
            let index = books.index(where: {$0 === book})
            books.remove(at: index!)
        }
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return authors.count
        case 1:
            return books.count
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Authors"
        case 1:
            return "Books"
        default:
            return nil
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "AuthorCell", for: indexPath)
            
            cell.textLabel?.text = authors[indexPath.row].name
            cell.detailTextLabel?.text = authors[indexPath.row].country
            
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath)
            
            cell.textLabel?.text = books[indexPath.row].name
            cell.detailTextLabel?.text = books[indexPath.row].author.name
            
            return cell
        default:
            return UITableViewCell()
        }
        
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
