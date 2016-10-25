//
//  FirstAIDTableViewController.swift
//  iSafe
//
//  Created by Rama Krishna on 10/12/16.
//  Copyright © 2016 Rama Krishna. All rights reserved.
//

import UIKit

class FirstAIDTableViewController: UITableViewController {
    
    var dataArray: Array<[String : AnyObject]>{
        get { return firstAidManager.getFirstAidData() }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        RegisterCells.registerTableViewCell(tableView)
        self.navigationItem.title = NSLocalizedString("FirstAID.FirstAIDPageTitle", comment: "First AID Pages")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataArray.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier: String = "singleLabelCell"
        
        guard let cell: SingleLableTableViewCell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as? SingleLableTableViewCell else{
            return UITableViewCell()
        }
        cell.titleLabel.text = dataArray[indexPath.row]["name"] as? String
        // Configure the cell...
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("FirstAIDQuestions", sender: indexPath)
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "FirstAIDQuestions"{
            let indexPath: NSIndexPath? = sender as? NSIndexPath
            guard let vc: FirstAIDQuestionsTableViewController? = segue.destinationViewController as? FirstAIDQuestionsTableViewController else{
                return
            }
            vc?.questionName = dataArray[(indexPath?.row)!]["name"] as? String
            vc?.questions = dataArray[(indexPath?.row)!]["questions"] as? Array<[String : AnyObject]>
        }
    }

}
