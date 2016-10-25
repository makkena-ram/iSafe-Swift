//
//  TextFieldValidation.swift
//  iSafe
//
//  Created by Rama Krishna on 10/16/16.
//  Copyright © 2016 Rama Krishna. All rights reserved.
//

import UIKit


enum TextFieldType{
    case PhoneNumber
    case FirstName
    case LastName
    case FullName
}
class TextFieldValidation: UITextField {
    
    var textFieldType: TextFieldType = .FirstName {
        didSet {
            configureTextField()
        }
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureTextField()
    }
    
    func configureTextField(){
        switch textFieldType {
            case .FirstName:
                keyboardType = .Default
            case .LastName:
                keyboardType = .Default
            case .PhoneNumber:
                keyboardType = .PhonePad
            case .FullName:
                keyboardType = .Default
        }
    }

}

extension TextFieldValidation{
    func isPhoneNumberValid() -> Bool{
        let phoneNumberRegEx = "^\\d{10}$"
        let phoneStringTest = NSPredicate(format:"SELF MATCHES %@", phoneNumberRegEx)
        return phoneStringTest.evaluateWithObject(self.text)
    }
    
    func isNameValid() -> Bool{
        let nameRegEx = "[A-Za-z]{1,}"
        let nameStringTest = NSPredicate(format: "SELF MATCHES %@", nameRegEx)
        return nameStringTest.evaluateWithObject(self.text)
    }
    
    func isFullNameValid() -> Bool{
        let fullNameRegEx = "[A-Za-z]{1,}\\s[A-Za-z]{1,}"
        let fullNameStringTest = NSPredicate(format: "SELF MATCHES %@", fullNameRegEx)
        return fullNameStringTest.evaluateWithObject(self.text)
    }
    
    
    func formatPhoneNumber() -> String{
        guard var phoneNumber = self.text else {
            return ""
        }
        let length = phoneNumber.characters.count
        
        switch length {
        case 10:
            phoneNumber.insert("-", atIndex: phoneNumber.startIndex.advancedBy(6))
            phoneNumber.insert("-", atIndex: phoneNumber.startIndex.advancedBy(3))
        case 7:
            phoneNumber.insert("-", atIndex: phoneNumber.startIndex.advancedBy(3))
        default:
            break
        }
        return phoneNumber

    }
}
