//
//  AddNewContactViewController.swift
//  iSafe
//
//  Created by Rama Krishna on 9/17/16.
//  Copyright © 2016 Rama Krishna. All rights reserved.
//

import UIKit



class AddNewContactViewController: UIViewController, AddGaurdiansViewControllerDelegate {

    @IBOutlet weak var emailIDTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    var newContact : NewContact?
    
    var addGaurdiansVC : AddGaurdiansViewController? = AddGaurdiansViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addGaurdiansVC?.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func saveBtnClicked(sender: UIButton) {
        var newContactDict : [String : String?] = [:]
        //Getting the Managed Object Context
        let delegate = UIApplication.sharedApplication().delegate as? AppDelegate
        let managedObjectContext = delegate?.managedObjectContext
        var contact : Contact? = nil
        if #available(iOS 10.0, *) {
             contact = Contact(context: managedObjectContext!)
        } else {
            // Fallback on earlier versions
        }
        
        contact?.name = nameTextField.text
        contact?.phoneNumber = phoneNumberTextField.text
        contact?.email = emailIDTextField.text
        delegate?.saveContext()
        
        
        newContactDict["name"] = nameTextField.text
        newContactDict["phoneNumber"] = phoneNumberTextField.text
        newContactDict["emailID"] = emailIDTextField.text
        newContact = NewContact(data: newContactDict)
        guard let newContact = self.newContact else {
            return
        }
        NewContact.contacts.append(newContact)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func cancelBtnClicked(sender: AnyObject) {
       self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func getContact() -> NewContact {
        var newContactDict : [String : String?] = [:]
        newContactDict["name"] = nameTextField.text
        newContactDict["phoneNumber"] = phoneNumberTextField.text
        newContactDict["emailID"] = emailIDTextField.text
        newContact = NewContact(data: newContactDict)
        return newContact!
    }
    
}
