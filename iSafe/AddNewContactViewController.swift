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
    
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    var newContact : NewContact?
    private var isFirstNameFieldValid: Bool = false
    private var isLastNameFieldValid: Bool = false
    private var isPhoneNumberFieldValid: Bool = false
    
    @IBOutlet weak var saveBtnClicked: PrimaryButton!
    @IBOutlet weak var cancelBtnClicked: SecondaryButton!
    
    var addGaurdiansVC : AddGaurdiansViewController? = AddGaurdiansViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstNameLabel.text = NSLocalizedString("AddNewContact.FirstName", comment: "Add New Contact")
        lastNameLabel.text = NSLocalizedString("AddNewContact.LastName", comment: "Add New Contact")
        phoneNumberLabel.text = NSLocalizedString("AddNewContact.PhoneNumber", comment: "Add New Contact")
        saveBtnClicked.setTitle(NSLocalizedString("AddNewContact.SaveButtonTitle", comment: "Add New Contact"), forState: .Normal)
        cancelBtnClicked.setTitle(NSLocalizedString("AddNewContact.CancelButtonTitle", comment: "Add New Contact"), forState: .Normal)
        saveBtnClicked.primaryBtnDisabled()
        saveBtnClicked.addTarget(self, action: #selector(saveBtnTapped), forControlEvents: .TouchUpInside)
        cancelBtnClicked.addTarget(self, action: #selector(cancelBtnTapped), forControlEvents: .TouchUpInside)
        firstNameTF.textFieldType = .FirstName
        lastNameTF.textFieldType = .LastName
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
        self.view.endEditing(true)
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
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}

extension AddNewContactViewController: UITextFieldDelegate{
    func textFieldDidEndEditing(textField: UITextField) {
        
        let validatingField: TextFieldValidation =  (textField as? TextFieldValidation)!
        if validatingField.textFieldType == .PhoneNumber{
            if validatingField.isPhoneNumberValid() && textField.text != "Please Enter Valid Phone Number"{
                textField.textColor = UIColor.blackColor()
                textField.text = validatingField.formatPhoneNumber()
                isPhoneNumberFieldValid = true
            }
            else{
                textField.textColor = UIColor.redColor()
                textField.text = "Please Enter Valid Phone Number"
                isPhoneNumberFieldValid = false
               
            }
        }
        else if validatingField.textFieldType == .FirstName{
            if validatingField.isNameValid() && textField.text != "Please Enter Name"{
                textField.textColor = UIColor.blackColor()
                isFirstNameFieldValid = true
                
            }
            else{
                textField.textColor = UIColor.redColor()
                textField.text = "Please Enter Name"
                isFirstNameFieldValid = false
            }
        }
        else{
            if validatingField.isNameValid() && textField.text != "Please Enter Name"{
                textField.textColor = UIColor.blackColor()
                isLastNameFieldValid = true
                
            }
            else{
                textField.textColor = UIColor.redColor()
                textField.text = "Please Enter Name"
                isLastNameFieldValid = false
            }
        }
        
        if isFirstNameFieldValid && isLastNameFieldValid && isPhoneNumberFieldValid{
            saveBtnClicked.primaryBtnEnabled()
        }
        else{
           saveBtnClicked.primaryBtnDisabled()
        }
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
