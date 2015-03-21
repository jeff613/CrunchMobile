//
//  DetailsViewController.swift
//  CrunchMobile
//
//  Created by Anoop tomar on 3/20/15.
//  Copyright (c) 2015 codepathaja. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var dialogView: UIView!
    @IBOutlet weak var stockView: UIView!
    @IBOutlet weak var valueView: UIView!
    @IBOutlet weak var workView: UIView!
    @IBOutlet weak var growthView: UIView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var comparyName: UILabel!
    @IBOutlet weak var founderName: UILabel!
    @IBOutlet weak var foundedOn: UILabel!
    @IBOutlet weak var employees: UILabel!
    @IBOutlet weak var website: UILabel!
    
    var company: CompanyData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setRoundCorner(dialogView, radius: 15)
        setRoundCorner(stockView, radius: 10)
        setRoundCorner(valueView, radius: 10)
        setRoundCorner(workView, radius: 10)
        setRoundCorner(growthView, radius: 10)
        setRoundCorner(profileImage, radius: 4)
        
        setupCells()
        // Do any additional setup after loading the view.
    }
    
    func setupCells(){
        self.comparyName.text = company?.companyName
        self.profileImage.setImageWithURL(NSURL(string: company!.profileImage!))
        self.founderName.text = company?.founders
        self.foundedOn.text = company?.foundedOn
        self.employees.text = "\(company!.numberOfEmployees!)"
        self.website.text = company?.webLabel
    }
    
    func setRoundCorner(view: UIView, radius: CGFloat){
        view.layer.cornerRadius = radius
        view.clipsToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismissDialog(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
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
