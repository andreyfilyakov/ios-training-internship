//
//  DataRepository.swift
//  PhoneBook
//
//  Created by Andrey Filyakov on 10/12/2018.
//  Copyright © 2018 MyCompany. All rights reserved.
//

import UIKit
import CoreData

class DataRepository {
    
    static func getContacts() -> [Contact] {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return []
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = Contact.fetchRequest() as NSFetchRequest<Contact>
        
        do {
            let contacts = try managedContext.fetch(fetchRequest)
            return contacts
        } catch {
            return []
        }
    }
    
    static func addContact(name: String, phoneNumber: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let contact = Contact(context: managedContext)
        contact.name = name
        contact.phoneNumber = phoneNumber
        
        do {
            try managedContext.save()
        } catch {
            return
        }
    }
    
    static func deleteContact(_ contact: Contact) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        managedContext.delete(contact)
        
        do {
            try managedContext.save()
        } catch {
            return
        }
    }
    
    static func getCalls() -> [Call] {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return []
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = Call.fetchRequest() as NSFetchRequest<Call>
        
        do {
            let calls = try managedContext.fetch(fetchRequest)
            return calls
        } catch {
            return []
        }
    }
    
    static func addCall(phoneNumber: String, time: Date) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = Contact.fetchRequest() as NSFetchRequest<Contact>
        fetchRequest.predicate = NSPredicate(format: "phoneNumber = %@", phoneNumber)
        
        let call = Call(context: managedContext)
        call.phoneNumber = phoneNumber
        call.time = time
        
        do {
            let contact = try managedContext.fetch(fetchRequest).first
            if let contact = contact {
                call.contact = contact
            }
            try managedContext.save()
        } catch  {
            return
        }
    }

}
