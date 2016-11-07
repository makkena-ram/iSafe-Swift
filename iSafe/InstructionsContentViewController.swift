//
//  InstructionsContentViewController.swift
//  iSafe
//
//  Created by Rama Personal on 10/25/16.
//  Copyright © 2016 Rama Krishna. All rights reserved.
//

import UIKit

class InstructionsContentViewController: UIViewController {

    @IBOutlet weak var instructionImage: UIImageView!
    var imageName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        instructionImage.image = UIImage(named: imageName!)
        instructionImage.layer.cornerRadius = 50.0
        instructionImage.clipsToBounds = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
