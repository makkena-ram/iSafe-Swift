//
//  ContactInfoTableViewCell.swift
//  iSafe
//
//  Created by Rama Krishna on 10/11/16.
//  Copyright © 2016 Rama Krishna. All rights reserved.
//

import UIKit

class ContactInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var contactImage: UIImageView!
    @IBOutlet weak var contactNameLabel: UILabel!
    @IBOutlet weak var contactPhoneNumberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
