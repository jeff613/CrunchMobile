//
//  Company.swift
//  CrunchMobile
//
//  Created by Jianfeng Ye on 3/10/15.
//  Copyright (c) 2015 codepathaja. All rights reserved.
//

import Foundation

class Company {
    var profileImage: String?
    var companyLoc: String?
    var ipoInfo: String?
    var founders: String?
    var acuisitions: String?
    var desc: String?
    var catLabel: String?
    var webLabel: String?
    
    init(profileImage: String, companyLoc: String, ipoInfo: String, founders: String, acuisitions: String, desc: String,  catLabel: String, webLabel: String){
        self.profileImage = profileImage
        self.companyLoc = companyLoc
        self.ipoInfo = ipoInfo
        self.founders = founders
        self.acuisitions = acuisitions
        self.desc = desc
        self.catLabel = catLabel
        self.webLabel = webLabel
    }
    
    class func ConvertToCompanyData(compArray: [NSDictionary]) -> [Company]{
        
        var companies = [Company]()
        
        for comp in compArray{
            var proImg = comp["Cprimary_image"] as NSString
            var compLo = comp["Cheadquarters"] as NSString
            var ipo = comp["Cipo"] as NSString
            var found = comp["Cfounders"] as NSString
            var acq = comp["Cnumber_of_employees"] as Int
            var des = comp["Cshort_description"] as NSString
            var foundOn = comp["Cfounded_on"] as NSString
            var url = comp["Chomepage_url"] as NSString
            
            companies.append(Company(profileImage: proImg, companyLoc: compLo, ipoInfo: ipo, founders: found, acuisitions: "\(acq)", desc: des, catLabel: foundOn, webLabel: url))
        }
        
        return companies
    }
}