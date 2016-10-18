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
    case Name
}
class TextFieldValidation: UITextField {
    
    var textFieldType: TextFieldType = .Name
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
            case .Name:
                self.keyboardType = .Default
            case .PhoneNumber:
                self.keyboardType = .PhonePad
        }
    }

}

extension TextFieldValidation{
    func isPhoneNumberValid() -> Bool{
        return self.text?.characters.count == 10 ? true : false
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
