//
//  AddNewContactViewController.swift
//  iSafe
//
//  Created by Rama Krishna on 9/17/16.
//  Copyright © 2016 Rama Krishna. All rights reserved.
//

import UIKit



class AddNewContactViewController: UIViewController {
    
    @IBOutlet weak var firstNameTF: TextFieldValidation!
    @IBOutlet weak var lastNameTF: TextFieldValidation!
    @IBOutlet weak var phoneNumberTF: TextFieldValidation!
    
    var newContact : NewContact?
    
    @IBOutlet weak var saveBtnClicked: PrimaryButton!
    @IBOutlet weak var cancelBtnClicked: SecondaryButton!
    
    var addGaurdiansVC : AddGaurdiansViewController? = AddGaurdiansViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //saveBtnClicked.primaryBtnDisabled()
        saveBtnClicked.addTarget(self, action: #selector(saveBtnTapped), forControlEvents: .TouchUpInside)
        cancelBtnClicked.addTarget(self, action: #selector(cancelBtnTapped), forControlEvents: .TouchUpInside)
        firstNameTF.textFieldType = .Name
        lastNameTF.textFieldType = .Name
        phoneNumberTF.textFieldType = .PhoneNumber
        firstNameTF.delegate = self
        lastNameTF.delegate = self
        phoneNumberTF.delegate = self
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
    
    func cancelBtnTapped(){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
   
    func saveBtnTapped() {
        var newContactDict : [String : AnyObject] = [:]
            
        let id:String = NSUUID().UUIDString
        newContactDict["firstName"] = firstNameTF.text
        newContactDict["lastName"] = lastNameTF.text
        newContactDict["phoneNumber"] = phoneNumberTF.text
        newContact = NewContact(id: id, data: newContactDict)
        firebaseManager.addUsersData(newContact!)
        guard let newContact = self.newContact else {
            return
        }
        NewContact.contacts.append(newContact)
        self.dismissViewControllerAnimated(true, completion: nil)

    }
}

extension AddNewContactViewController: UITextFieldDelegate{
    func textFieldDidEndEditing(textField: UITextField) {
        let validatingField: TextFieldValidation =  (textField as? TextFieldValidation)!
        if validatingField.textFieldType == .PhoneNumber && validatingField.isPhoneNumberValid(){
            textField.text = validatingField.formatPhoneNumber()
        }
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
