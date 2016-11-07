//
//  FirebaseManager.swift
//  iSafe
//
//  Created by Rama Krishna on 10/12/16.
//  Copyright © 2016 Rama Krishna. All rights reserved.
//

import UIKit
import FirebaseDatabase

let firebaseManager = FirebaseManager.sharedInstance

class FirebaseManager: NSObject {
    
    class var sharedInstance: FirebaseManager {
        
        get {
            struct Static {
                static var instance: FirebaseManager? = nil
                static var token: dispatch_once_t = 0
            }
            dispatch_once(&Static.token) { 
                Static.instance = FirebaseManager()
            }
            return Static.instance!
        }
    }
    
    var ref: FIRDatabaseReference!
    var contacts: [NewContact] = []
    
    override init() {
        super.init()
        
        ref = FIRDatabase.database().referenceFromURL("https://isafe-10ab6.firebaseio.com/")
        
        getContacts()
    }
    
    func getContacts(){
        
        let queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
        dispatch_async(queue) {
            firebaseManager.ref.child("users").observeEventType(.Value, withBlock: { (snapshot) in
                
                if let users = snapshot.value as? [String:[String:AnyObject]] {
                    
                    for (id, userData) in users {
                        
                        print(userData)
                        
                        var firstName:String = ""
                        var lastName:String = ""
                        var phoneNumber:String = ""
                        
                        if let val = userData["firstName"] as? String {
                            firstName = val
                        }
                        
                        if let val = userData["lastName"] as? String {
                            lastName = val
                        }
                        
                        if let val = userData["phoneNumber"] as? String {
                            phoneNumber = val
                        }
                        
                        let contactDict: [String : AnyObject] = ["firstName" : firstName, "lastName" : lastName, "phoneNumber" : phoneNumber]
                        self.addContact(NewContact(id: id, data: contactDict))
                    }
                }
                
                dispatch_async(dispatch_get_main_queue(), { 
                    NSNotificationCenter.defaultCenter().postNotificationName(kNotification_UpdateContacts, object: nil)
                })
            })
        }
    }
    
    private func addContact(contact:NewContact) {
        
        for contactIter in NewContact.contacts {
            
            if contactIter.id == contact.id {
                
                NewContact.contacts.removeAtIndex(NewContact.contacts.indexOf(contactIter)!)
                NewContact.contacts.append(contact)
                return
            }
        }
        
        NewContact.contacts.append(contact)
    }
    
    func addUsersData(contact: NewContact) {
        
        let childRef = firebaseManager.ref.child("users").childByAutoId()
        childRef.child("firstName").setValue(contact.firstName!)
        childRef.child("lastName").setValue(contact.lastName!)
        childRef.child("phoneNumber").setValue(contact.phoneNumber!)
        
    }
    
    func deleteUser(id: String){
        firebaseManager.ref.child("users").child(id).removeValue()
    }
}
