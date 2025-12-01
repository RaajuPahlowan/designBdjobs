//
//  EmployerListData.swift
//  testBdjobs
//
//  Created by Fahim Mashroor on 1/12/25.
//

import Foundation

struct EmployerListData : Codable {
    let companyID : String?
    let companyName : String?
    let jobCount : String?
    let isaliasname: String?

    enum CodingKeys: String, CodingKey {

        case companyID = "companyid"
        case companyName = "companyname"
        case jobCount = "totaljobs"
        case isaliasname = "isaliasname"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        companyID = try values.decodeIfPresent(String.self, forKey: .companyID)
        companyName = try values.decodeIfPresent(String.self, forKey: .companyName)
        jobCount = try values.decodeIfPresent(String.self, forKey: .jobCount)
        isaliasname = try values.decodeIfPresent(String.self, forKey: .isaliasname)
    }

}
