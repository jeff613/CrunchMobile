//
//  MainViewController.swift
//  CrunchMobile
//
//  Created by Anoop tomar on 3/10/15.
//  Copyright (c) 2015 codepathaja. All rights reserved.
//

import UIKit

class MainViewController: UIViewController{

    @IBOutlet weak var tableView: UITableView!
    var companyData = [CompanyData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        reloadDataFromNetwork()
      }
    func reloadDataFromNetwork(){
        CrunchClient.getCompanyList(0, count: 10) { (companies) -> () in
            self.companyData = companies!
            self.tableView.reloadData()
        }
    }

}

extension MainViewController: UITableViewDataSource{
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("tableCell") as MainTableViewCell
        cell.setupCell(companyData[indexPath.row])
        return cell
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return companyData.count
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}

extension MainViewController: UITableViewDelegate{

}
