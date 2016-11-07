//
//  NameViewController.swift
//  iSafe
//
//  Created by Rama Personal on 10/22/16.
//  Copyright © 2016 Rama Krishna. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameTF: TextFieldValidation!
    @IBOutlet weak var passwordTF: TextFieldValidation!
    @IBOutlet weak var forgotPwdBtn: PrimaryButton!
    @IBOutlet weak var submitBtn: PrimaryButton!
    @IBOutlet weak var registerBtn: PrimaryButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        submitBtn.backgroundColor = UIColor.clearColor()
        submitBtn.layer.borderColor = UIColor.clearColor().CGColor
        submitBtn.primaryBtnDisabled()
        userNameTF.textFieldType = .FullName
        submitBtn.addTarget(self, action: #selector(submitBtnClicked), forControlEvents: .TouchUpInside)
        navigationItem.title = "Log in"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func submitBtnClicked(){
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setBool(true, forKey: "isFullNameSubmitted")
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let homeVC = mainStoryBoard.instantiateViewControllerWithIdentifier("MainViewController")
        self.navigationController?.pushViewController(homeVC, animated: true)
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

extension LoginViewController: UITextFieldDelegate{
    func textFieldDidBeginEditing(textField: UITextField) {
        textField.textColor = UIColor.blackColor()
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        let validatingField: TextFieldValidation =  (textField as? TextFieldValidation)!
        if validatingField.textFieldType == .FullName{
            if validatingField.isFullNameValid() && textField.text != "Please Enter Your Full Name"{
                textField.textColor = UIColor.blackColor()
                textField.text = validatingField.formatPhoneNumber()
                submitBtn.primaryBtnEnabled()
                submitBtn.backgroundColor = UIColor.clearColor()
            }
            else{
                textField.textColor = UIColor.redColor()
                textField.text = "Please Enter Your Full Name"
                submitBtn.primaryBtnDisabled()
                
            }
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
