//
//  SaveButton.swift
//  iSafe
//
//  Created by Rama Krishna on 10/16/16.
//  Copyright © 2016 Rama Krishna. All rights reserved.
//

import UIKit

class PrimaryButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.borderColor = UIColor.lightGrayColor().CGColor
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = 10.0
    }
    
    func primaryBtnEnabled(){
        self.enabled = true
        self.backgroundColor = UIColor.init(red: 24/255, green: 149/255, blue: 146/255, alpha: 1)
    }
    
    func primaryBtnDisabled() {
        self.enabled = false
        self.backgroundColor = UIColor.grayColor()
    }

}
