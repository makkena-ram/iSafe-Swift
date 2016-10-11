//
//  Contact+CoreDataProperties.swift
//  iSafe
//
//  Created by Rama Krishna on 9/28/16.
//  Copyright © 2016 Rama Krishna. All rights reserved.
//

import Foundation
import CoreData


extension Contact {

    @nonobjc public override class func fetchRequest() -> NSFetchRequest {
        return NSFetchRequest(entityName: "Contact");
    }

    @NSManaged public var name: String?
    @NSManaged public var phoneNumber: String?
    @NSManaged public var email: String?

}
