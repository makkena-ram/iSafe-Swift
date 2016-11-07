//
//  InstructionsViewController.swift
//  iSafe
//
//  Created by Rama Personal on 10/24/16.
//  Copyright © 2016 Rama Krishna. All rights reserved.
//

import UIKit

class InstructionsViewController: UIViewController, UIPageViewControllerDataSource {
    
    var pageViewController: UIPageViewController?
    var index: Int? = 0
    var instructionImages = ["HomeImage", "AddGuardiansImage", "FirstAIDListsImage","AddNewGuardiansImage"]
    
    @IBOutlet weak var doneBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* Getting the page View controller */
        pageViewController = self.storyboard?.instantiateViewControllerWithIdentifier("MyPageViewController") as? UIPageViewController
        self.pageViewController?.dataSource = self
        
        let pageContentViewController = self.viewControllerAtIndex(0)
        self.pageViewController?.setViewControllers([pageContentViewController], direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil)
        
        /* We are substracting 30 because we have a start again button whose height is 30*/
        self.pageViewController?.view.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height - 30)
        self.addChildViewController(pageViewController!)
        self.view.addSubview(pageViewController!.view)
        self.pageViewController?.didMoveToParentViewController(self)
        doneBtn.hidden = true
        doneBtn.addTarget(self, action: #selector(doneBtnClicked), forControlEvents: .TouchUpInside)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        var index: Int = self.index!
        
        if (index == 0) {
            return nil;
        }
        
        if index == instructionImages.count - 1 {
            doneBtn.hidden = false
        }
        else{
            doneBtn.hidden = true
        }
        
        index = index - 1
        
        return self.viewControllerAtIndex(index)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        var index: Int = self.index!
        
        index = index + 1
        
        if index == instructionImages.count - 1 {
            doneBtn.hidden = false
        }
        else{
            doneBtn.hidden = true
        }
        
        if (index == instructionImages.count - 1) {
            return nil;
        }
        
        return self.viewControllerAtIndex(index)
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        // The number of items reflected in the page indicator.
        return instructionImages.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        // The selected item reflected in the page indicator.
        return 0
    }
    
    private func viewControllerAtIndex(index: Int) -> InstructionsContentViewController{
        let instructionsContentVC: InstructionsContentViewController = (self.storyboard?.instantiateViewControllerWithIdentifier("InstructionsContentViewController") as? InstructionsContentViewController)!
        self.index = index;
        instructionsContentVC.imageName = instructionImages[index]
        return instructionsContentVC
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

extension InstructionsViewController{
    
    func doneBtnClicked(){
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let navigationController:UINavigationController = storyBoard.instantiateInitialViewController() as! UINavigationController
        let rootViewController = storyBoard.instantiateViewControllerWithIdentifier("NameViewController")
        let delegate = UIApplication.sharedApplication().delegate as! AppDelegate
        navigationController.viewControllers = [rootViewController]
        delegate.window!.rootViewController = navigationController
        //Setting NSUserDefaults for the One time display
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setBool(true, forKey: "isInstructionsVCDisplayed")
    }
}
