//
//  ViewController.swift
//  iSafe
//
//  Created by Rama Krishna on 9/17/16.
//  Copyright © 2016 Rama Krishna. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    
    @IBOutlet weak var addGuardiansBtn: UIButton!
    @IBOutlet weak var sOSBtn: UIButton!
    @IBOutlet weak var firstAidBtn: UIButton!
    @IBOutlet weak var videoRecording: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        self.navigationItem.title = NSLocalizedString("Home.HomePageTitle", comment: "Home Landing Page")
        addGuardiansBtn.setTitle(NSLocalizedString("Home.AddGuardians", comment: "Home Landing Page"), forState: .Normal)
        sOSBtn.setTitle(NSLocalizedString("Home.SOS", comment: "Home Landing Page"), forState: .Normal)
        firstAidBtn.setTitle(NSLocalizedString("Home.FirstAID", comment: "Home Landing Page"), forState: .Normal)
        videoRecording.setTitle(NSLocalizedString("Home.VideoRecording", comment: "Home Landing Page"), forState: .Normal)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

