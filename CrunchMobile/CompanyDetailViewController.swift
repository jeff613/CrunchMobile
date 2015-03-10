//
//  CompanyDetailViewController.swift
//  CrunchMobile
//
//  Created by Jianfeng Ye on 3/10/15.
//  Copyright (c) 2015 codepathaja. All rights reserved.
//

import UIKit

class CompanyDetailViewController: UIViewController {
    
    
    @IBOutlet weak var companyNameLabel: UILabel!
    
    @IBOutlet weak var companyImageView: UIImageView!
    
    var company: Company?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        companyNameLabel.text = company?.name
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
