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
    
    @IBOutlet weak var circleChartTest: UIView!
    @IBOutlet weak var workCircleView: UIView!
    
    var circleChart: PNCircleChart?
    var workCircleChart: PNCircleChart?
    
    // valuation
    @IBOutlet weak var valuationLabel: UILabel!
    
    // stock
    @IBOutlet weak var stockLabel: UILabel!
    
    // growth
    @IBOutlet weak var growthLabel: UILabel!
    
    // culture
    @IBOutlet weak var workLabel: UILabel!
    
    var company: CompanyData?
    var textColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setRoundCorner(dialogView, radius: 15)
        setRoundCorner(stockView, radius: 10)
        setRoundCorner(valueView, radius: 10)
        setRoundCorner(workView, radius: 10)
        setRoundCorner(growthView, radius: 10)
        setRoundCorner(profileImage, radius: 4)
        
        textColor = valuationLabel.textColor
        
        setupCells()
        
        setupCircleChart()
        setupWorkCircle()
    }
    
    func setupWorkCircle(){
        self.workCircleChart = PNCircleChart(frame: CGRectMake(0, 0, workCircleView.frame.width, workCircleView.frame.height), total: 100, current: 0, clockwise: true)
        //PNCircleChart(frame: CGRectMake(0, 0, circleChartTest.frame.width, circleChartTest.frame.height))
        self.workCircleChart?.backgroundColor = UIColor.clearColor()
        self.workCircleChart?.strokeColor = textColor
        self.workCircleChart?.countingLabel.font = UIFont(name: "Times", size: 14)
        self.workCircleChart?.countingLabel.textColor = textColor
        self.workCircleChart?.strokeChart()
        self.workCircleChart?.circleBackground.strokeColor = dialogView.backgroundColor?.CGColor
        
        workCircleView.addSubview(self.workCircleChart!)
        
        self.workCircleChart?.updateChartByCurrent(company?.companyCulture?.CulturePercent)
    }
    func setupCircleChart(){
        self.circleChart = PNCircleChart(frame: CGRectMake(0, 0, circleChartTest.frame.width, circleChartTest.frame.height), total: 100, current: 0, clockwise: true)
            //PNCircleChart(frame: CGRectMake(0, 0, circleChartTest.frame.width, circleChartTest.frame.height))
        self.circleChart?.backgroundColor = UIColor.clearColor()
        self.circleChart?.strokeColor = textColor
        self.circleChart?.countingLabel.font = UIFont(name: "Times", size: 14)
        self.circleChart?.countingLabel.textColor = textColor
        self.circleChart?.strokeChart()
        self.circleChart?.circleBackground.strokeColor = dialogView.backgroundColor?.CGColor
        
        circleChartTest.addSubview(self.circleChart!)
        
        self.circleChart?.updateChartByCurrent(company?.companyGrowth?.GrowthRate)
    }
    
    func setupCells(){
        self.comparyName.text = company?.companyName
        self.profileImage.setImageWithURL(NSURL(string: company!.profileImage!))
        self.founderName.text = company?.founders
        self.foundedOn.text = company?.foundedOn
        self.employees.text = "\(company!.numberOfEmployees!)"
        self.website.text = company?.webLabel
        var formattedValuation = NSString(format: "%.2f", company!.companyValue!.Valuation)
        self.valuationLabel.text = "$\(formattedValuation)M"
        
        var formattedStock = NSString(format: "%.2f", company!.companyStock!.StockPrice)
        self.stockLabel.text = "$\(formattedStock)"
        let growth = company?.companyGrowth?.GrowthRate!
        self.growthLabel.text = "\(growth!)%"
        let culture = company?.companyCulture?.CulturePercent
        self.workLabel.text = "\(culture!)%"
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
