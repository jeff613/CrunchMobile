//
//  MockData.swift
//  CrunchMobile
//
//  Created by Anoop tomar on 3/10/15.
//  Copyright (c) 2015 codepathaja. All rights reserved.
//

import UIKit

class MockData
{
    class func CompanyMockData() -> [CompanyData]{
        var companiesData = [CompanyData]()
        var company = CompanyData(profileImage: "https://res.cloudinary.com/crunchbase-production/image/upload/v1418366754/k23m3rc1nhi1gpbhubon.jpg", companyLoc: "Sunnyvale, CA", ipoInfo: "Went public on April 12, 1996", founders: "David Filo, Jerry Yang", acuisitions: "116 Acquisitions", desc: "Yahoo is the world's largest start-up, which means that we move fast and always let our users lead the way.", catLabel: "Portals, Photography, Email", webLabel: "www.yahoo.com")
        
        var company1 = CompanyData(profileImage: "https://crunchbase-production-res.cloudinary.com/image/upload/c_pad,h_98,w_98/v1398126453/adu2g57bgen4u9lb1kb1.png", companyLoc: "Mountain View, CA", ipoInfo: "Went Public on May 19, 2011 / LNKD", founders: "Eric Ly, Konstantin Guericke,", acuisitions: "12 Acquisitions", desc: "LinkedIn, a professional networking site, allows its members to create business connections, search for jobs, and find potential clients.", catLabel: "Software, Networking, Social Media", webLabel: "www.linkedIn.com")
        
        var company2 = CompanyData(profileImage: "https://crunchbase-production-res.cloudinary.com/image/upload/c_pad,h_98,w_98/v1408491700/ypqf483smhnqo0rh6mff.png", companyLoc: "Menlo Park, CA", ipoInfo: "Went Public on May 18, 2012 / FB", founders: "Mark Zuckerberg, Andrew McCollum", acuisitions: "52 Acquisitions", desc: "Facebook is an online social networking service that enables its users to connect with friends and family as well as make new connections.", catLabel: "Social Media", webLabel: "www.facebook.com")
        
        var company3 = CompanyData(profileImage: "https://crunchbase-production-res.cloudinary.com/image/upload/c_pad,h_98,w_98/v1412848781/ub44kt96u00ampxwdoqh.png", companyLoc: "San Francisco, CA", ipoInfo: "$1.1 Billion in 6 Rounds from 24 Investors", founders: "David Filo, Jerry Yang", acuisitions: "21 Acquisitions", desc: "Dropbox for Business enables users to protect their files with admin control, dedicated support, and more.", catLabel: "Web Hosting", webLabel: "www.dropbox.com")
        
        companiesData.append(company)
        companiesData.append(company1)
        companiesData.append(company2)
        companiesData.append(company3)
        
        return companiesData
    }
}