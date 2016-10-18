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
import FirebaseDatabase

class AddGaurdiansViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var addGaurdianstableView: UITableView!
    @IBOutlet weak var spinnerView: UIActivityIndicatorView!
    
    var contacts: [NewContact] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        addGaurdianstableView.delegate = self
        addGaurdianstableView.dataSource = self
        navigationItem.title = "Add Gaurdians"
        RegisterCells.registerTableViewCell(addGaurdianstableView)
        addGaurdianstableView.tableFooterView = UIView()
        updateView()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(self.updateView), name: kNotification_UpdateContacts, object: nil)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(true)
        
        NSNotificationCenter.defaultCenter().removeObserver(self, name: kNotification_UpdateContacts, object: nil)
    }
    
    @objc private func updateView() {
        spinnerView.startAnimating()
        contacts = NewContact.contacts
        addGaurdianstableView.reloadData()
        spinnerView.stopAnimating()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func numberOfSections(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier : String = "contactInfoCell"
        
        guard  let contactCell:ContactInfoTableViewCell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as? ContactInfoTableViewCell else {
            return UITableViewCell()
        }

        let newContact = contacts[indexPath.row]
        if newContact.firstName == nil{
            contactCell.contactNameLabel.text = ""
        }
            
        else if newContact.lastName == nil{
            contactCell.contactNameLabel.text = newContact.firstName!
        }
        else{
           contactCell.contactNameLabel.text = newContact.firstName! + " " + newContact.lastName! 
        }
        if newContact.phoneNumber == nil{
            contactCell.contactPhoneNumberLabel.text = ""
        }
        else{
             contactCell.contactPhoneNumberLabel.text = String(format: "%@",newContact.phoneNumber!)
        }
        
       
       // contactCell?.contactImage.image = UIImage("")
        return contactCell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    @IBAction func addFromContactsBtnClicked(sender: UIButton) {
        
        let picker:CNContactPickerViewController = CNContactPickerViewController()
        picker.delegate = self
        picker.displayedPropertyKeys = [CNContactEmailAddressesKey, CNContactPhoneNumbersKey]
        
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
        var contactDict : [String : AnyObject] = [:]
        contactDict["firstName"] = contactProperty.contact.givenName
        contactDict["lastName"] = contactProperty.contact.familyName
        let phonenumber: CNPhoneNumber? = contactProperty.value as? CNPhoneNumber
        guard let phoneNumber = phonenumber else {
            return
        }
        contactDict["phoneNumber"] = phoneNumber.stringValue
        
        let id:String = NSUUID().UUIDString
        let newContact: NewContact = NewContact(id: id, data: contactDict)
        firebaseManager.addUsersData(newContact)

    }
}
