//
//  AddGaurdiansViewController.swift
//  iSafe
//
//  Created by Rama Krishna on 9/17/16.
//  Copyright © 2016 Rama Krishna. All rights reserved.
//

import UIKit
import AddressBookUI
import ContactsUI

protocol AddGaurdiansViewControllerInputDelegate {
    func setDelegate(delegate : AddGaurdiansViewControllerDelegate?)
}

protocol AddGaurdiansViewControllerDelegate {
    func getContact() -> NewContact
}

class AddGaurdiansViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var addGaurdianstableView: UITableView!
    
    var delegate : AddGaurdiansViewControllerDelegate? = nil
    
    func setDelegate(delegate : AddGaurdiansViewControllerDelegate?){
        self.delegate = delegate
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addGaurdianstableView.delegate = self
        addGaurdianstableView.dataSource = self
        navigationItem.title = "Add Gaurdians"
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        addGaurdianstableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func numberOfSections(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NewContact.getContacts().count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier : String = "ContactCell"
        
        let contactCell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
        let newContact = NewContact.getContacts()[indexPath.row]
        contactCell.textLabel?.text = newContact.data["name"]!
        contactCell.detailTextLabel?.text = newContact.data["phoneNumber"]!
        return contactCell
    }
    
    @IBAction func addFromContactsBtnClicked(sender: AnyObject) {
        
        let picker:CNContactPickerViewController = CNContactPickerViewController()
        picker.delegate = self
        picker.displayedPropertyKeys = ["phoneNumbers"]
        
//        picker.displayedProperties = [NSNumber(unsignedInt: UInt32(kABPersonPhoneProperty))]
        
//        let alert:UIAlertController = UIAlertController(title: "", message: "Opening Contacts...", preferredStyle: .Alert)
//        self.presentViewController(alert, animated: true, completion: nil)
        
        self.presentViewController(picker, animated: true) { () -> Void in
            
//            alert.dismissViewControllerAnimated(true, completion: { 
//                
//                
//            })
        }
    }
}

extension AddGaurdiansViewController: CNContactPickerDelegate {
    
    func contactPicker(picker: CNContactPickerViewController, didSelectContactProperty contactProperty: CNContactProperty) {
        
        print("")
    }
}
