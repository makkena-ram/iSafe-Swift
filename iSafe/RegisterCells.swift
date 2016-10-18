//
//  RegisterCells.swift
//  iSafe
//
//  Created by Rama Krishna on 10/11/16.
//  Copyright © 2016 Rama Krishna. All rights reserved.
//

import Foundation
import UIKit

class RegisterCells: NSObject {
    
    class func registerTableViewCell(tableView: UITableView){
        tableView.registerNib(UINib(nibName: "ContactInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "contactInfoCell")
         tableView.registerNib(UINib(nibName: "SingleLableTableViewCell", bundle: nil), forCellReuseIdentifier: "singleLabelCell")
    }
}
