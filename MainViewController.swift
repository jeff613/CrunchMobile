//
//  MainViewController.swift
//  CrunchMobile
//
//  Created by Anoop tomar on 3/10/15.
//  Copyright (c) 2015 codepathaja. All rights reserved.
//

import UIKit

class MainViewController: UIViewController{
    
    var tableViewOffset = CGPointZero

    @IBOutlet weak var tableView: UITableView!
    var companyData = [CompanyData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        reloadDataFromNetwork()
        //self.tableView.rowHeight = UITableViewAutomaticDimension;
        self.tableView.backgroundColor = UIColor.whiteColor()
        self.tableView.estimatedRowHeight = 45
       // self.tableView.rowHeight = UITableViewAutomaticDimension
        
        addTableHeader()
      }
    
    func reloadDataFromNetwork(){
        CrunchClient.getCompanyList(0, count: 10) { (companies) -> () in
            self.companyData = companies!
            self.tableView.reloadData()
        }
    }
    
    func addTableHeader(){
        var headerFrame = CGRectMake(0, 0, self.tableView.frame.width, self.tableView.frame.height - 300)
        var headerImage = UIImageView(image: UIImage(named: "IMG_0055")!)
        headerImage.contentMode = UIViewContentMode.ScaleAspectFill
        headerImage.bounds = CGRect(x: 0, y: 0, width: headerFrame.width, height: headerFrame.height)
        self.tableView.tableHeaderView = headerImage
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        if(self.tableViewOffset.y != self.tableView.contentOffset.y){
            UIView.animateWithDuration(0.5, animations: {
                self.tableView.contentOffset = self.tableViewOffset
            }, completion: { (finished) -> Void in
                self.tableViewOffset = CGPointZero
            })
        }
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        self.tableViewOffset = self.tableView.contentOffset
        var destVC = segue.destinationViewController as DetailsViewController
        var indexPath = self.tableView.indexPathForSelectedRow()
        destVC.company = companyData[indexPath!.row]
    }
}

extension MainViewController: UITableViewDataSource{
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("tableCell", forIndexPath: indexPath) as MainTableViewCell
    
        cell.setupCell(companyData[indexPath.row])
        return cell
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return companyData.count
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44.0
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
   
}

extension MainViewController: UITableViewDelegate{

}
