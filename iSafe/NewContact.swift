//
//  NewContact.swift
//  iSafe
//
//  Created by Rama Krishna on 9/17/16.
//  Copyright © 2016 Rama Krishna. All rights reserved.
//

import UIKit

class NewContact: NSObject {
    
    static var contacts : [NewContact] = []
    var id: String?
    var firstName: String?
    var lastName: String?
    var phoneNumber: String?
    
    init(id:String, data : [String : AnyObject]) {
        super.init()
        self.id = id
        firstName = data["firstName"] as? String
        lastName = data["lastName"] as? String
        phoneNumber = data["phoneNumber"] as? String
    }
    
    func toAnyObject() -> Any{
        return [
            "firstName": firstName,
            "lastName": lastName,
            "phoneNumber": phoneNumber
        ]

    }
}


