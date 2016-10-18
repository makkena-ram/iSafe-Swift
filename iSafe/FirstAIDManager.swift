//
//  FirstAIDManager.swift
//  iSafe
//
//  Created by Rama Krishna on 10/13/16.
//  Copyright © 2016 Rama Krishna. All rights reserved.
//

import Foundation

let firstAidManager = FirstAIDManager.sharedInstance

class FirstAIDManager: NSObject{
    
    class var sharedInstance: FirstAIDManager{
        get {
            struct Static{
                static var instace: FirstAIDManager? = nil
                static var token: dispatch_once_t = 0
            }
            dispatch_once(&Static.token){
                Static.instace = FirstAIDManager()
            }
            return Static.instace!
        }
    }
}

extension FirstAIDManager{
    func getFirstAidData() -> Array<[String : AnyObject]>{
        var jsonDataArray : Array<[String : AnyObject]>?
        var jsonDict : [String : AnyObject]? = [:]
        guard let firstAidJsonFile: String = NSBundle.mainBundle().pathForResource("FirstAID", ofType: "json", inDirectory: nil) else{
            print("Problem in finding the File")
            return Array<[String : AnyObject]>()
        }
        guard let jsonData: NSData = NSData.init(contentsOfFile: firstAidJsonFile) else{
                return Array<[String : AnyObject]>()
        }
        do{
            jsonDict = try NSJSONSerialization.JSONObjectWithData(jsonData, options: .AllowFragments) as? [String : AnyObject]
        }
        catch{
            print("Something went wrong while parsing")
        }
        if let jsonDict = jsonDict{
            jsonDataArray = parseData(jsonDict)
        }
       
        guard let jsondataArray = jsonDataArray else {
            return Array<[String : AnyObject]>()
        }
        
        return jsondataArray
        
    }
    
    private func parseData(jsonDict: [String : AnyObject]) -> Array<[String : AnyObject]>{
        guard let lists : Array<[String : AnyObject]> = jsonDict["FirstAidList"] as? Array<[String : AnyObject]> else {
            return Array<[String : AnyObject]>()
        }
        return lists
    }
}
