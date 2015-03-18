//
//  CompanyData.swift
//  CrunchMobile
//
//  Created by Anoop tomar on 3/10/15.
//  Copyright (c) 2015 codepathaja. All rights reserved.
//

import UIKit

class CompanyData
{
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
}
