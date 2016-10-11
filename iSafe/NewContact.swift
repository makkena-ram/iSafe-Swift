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
    var data: [String : String?] = [:]
    
    init(data : [String : String?]) {
        self.data = data
        super.init()
    }
    
    static func getContacts() -> [NewContact] {
        return self.contacts
    }
}


