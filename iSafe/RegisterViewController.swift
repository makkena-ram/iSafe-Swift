//
//  RegisterViewController.swift
//  iSafe
//
//  Created by Rama Personal on 10/30/16.
//  Copyright © 2016 Rama Krishna. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var userNameTF: TextFieldValidation!
    @IBOutlet weak var passwordBtn: TextFieldValidation!
    @IBOutlet weak var confirmPwdBtn: TextFieldValidation!
    @IBOutlet weak var registerBtn: PrimaryButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Register"
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
