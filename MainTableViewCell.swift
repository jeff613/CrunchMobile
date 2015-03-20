//
//  MainTableViewCell.swift
//  CrunchMobile
//
//  Created by Anoop tomar on 3/19/15.
//  Copyright (c) 2015 codepathaja. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var companyLogo: UIImageView!
    @IBOutlet weak var companyName: UILabel!
    
    @IBOutlet weak var companyAddress: UILabel!
    
    @IBOutlet weak var ipoInfo: UILabel!
    
    @IBOutlet weak var founderInfo: UILabel!
    @IBOutlet weak var foundedOn: UILabel!
    @IBOutlet weak var employeeNumber: UILabel!
    @IBOutlet weak var stockSymbol: UILabel!
    @IBOutlet weak var companyDesc: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setupCell(company: CompanyData){
        self.companyLogo.setImageWithURL(NSURL(string: company.profileImage!))
        self.companyName.text = company.companyName
        self.companyAddress.text = company.companyLoc
        self.ipoInfo.text = company.ipoInfo
        self.founderInfo.text = company.founders
        self.foundedOn.text = company.foundedOn
        self.employeeNumber.text = "\(company.numberOfEmployees)"
        self.stockSymbol.text = company.stockSym
        self.companyDesc.text = company.fullDesc
    }
}
