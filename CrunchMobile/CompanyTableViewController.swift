//
//  CompanyTableViewController.swift
//  CrunchMobile
//
//  Created by Jianfeng Ye on 3/9/15.
//  Copyright (c) 2015 codepathaja. All rights reserved.
//

import UIKit

class CompanyTableViewController: UITableViewController {
    
    var data = [Company]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.tableView.contentInset = UIEdgeInsets(top: 4, left: 0, bottom: 0, right: 0)
        
        self.tableView.registerNib(UINib(nibName: "CompanyTableViewCell", bundle: nil), forCellReuseIdentifier: "CompanyCell")
        
        //data = MockData.CompanyMockData()
        reloadDataFromNetwork()
    }
    
    func reloadDataFromNetwork(){
        CrunchClient.getOrgList(0, count: 10) { (companies) -> () in
            self.data = companies!
            self.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return data.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CompanyCell", forIndexPath: indexPath) as CompanyTableViewCell
        
        cell.setupCell(data[indexPath.row])

        return cell
    }
    
    override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let detailsView = CompanyDetailViewController(nibName: "CompanyDetailViewController", bundle: nil)
        let gossipView = CompanyGossipViewController(nibName: "CompanyGossipViewController", bundle: nil)
        
        let tabView = UITabBarController()
        tabView.viewControllers = [gossipView, detailsView]
        gossipView.tabBarItem = UITabBarItem(title: "Gossip", image: nil, tag: 0)
        detailsView.tabBarItem = UITabBarItem(title: "Info", image: nil, tag: 1)
        tabView.tabBar.barTintColor = barColor
        tabView.tabBar.tintColor = barTextColor
        //let company = Company(name: "Company \(indexPath.row)")
        //detailsView.company = company
        self.navigationController?.pushViewController(tabView, animated: true)
    }
    
}
