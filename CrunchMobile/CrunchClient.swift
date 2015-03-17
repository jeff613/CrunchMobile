//
//  CrunchClient.swift
//  CrunchMobile
//
//  Created by Anoop tomar on 3/12/15.
//  Copyright (c) 2015 codepathaja. All rights reserved.
//

import UIKit

class CrunchClient{

    class var SharedInstance: AFHTTPRequestOperationManager{
        return AFHTTPRequestOperationManager()
    }
    
    class func getOrgList(skip: Int, count: Int){
        CrunchClient.SharedInstance.GET(sharedVariables.apiBaseUrl+"info?skip=\(skip)&count=\(count)", parameters: nil, success: { (operation: AFHTTPRequestOperation!, response: AnyObject!) -> Void in
            var results = response as NSArray
            for index in 0..<results.count{
                println("------------------------------------------")
                println(results[index])
                println("------------------------------------------")
            }
            }, failure: {(operation: AFHTTPRequestOperation!, error:NSError!) -> Void in
            
            })
        
    }
}

