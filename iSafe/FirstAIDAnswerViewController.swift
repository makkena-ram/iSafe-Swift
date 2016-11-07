//
//  FirstAIDAnswerViewController.swift
//  iSafe
//
//  Created by Rama Krishna on 10/13/16.
//  Copyright © 2016 Rama Krishna. All rights reserved.
//

import UIKit

class FirstAIDAnswerViewController: UIViewController {
    
    @IBOutlet weak var answerWebView: UIWebView!
    var answer: String?
    var questionName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = questionName
        answerWebView.loadHTMLString(answer!, baseURL: nil)
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
