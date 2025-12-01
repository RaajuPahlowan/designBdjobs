//
//  EmployerListRoot.swift
//  testBdjobs
//
//  Created by Fahim Mashroor on 1/12/25.
//

import Foundation

struct EmployerListRoot : Codable {
    let statuscode : String?
    let message : String?
    let data : [EmployerListData]?
    let common : EmployerListCommon?

    enum CodingKeys: String, CodingKey {

        case statuscode = "statuscode"
        case message = "message"
        case data = "data"
        case common = "common"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        statuscode = try values.decodeIfPresent(String.self, forKey: .statuscode)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        data = try values.decodeIfPresent([EmployerListData].self, forKey: .data)
        common = try values.decodeIfPresent(EmployerListCommon.self, forKey: .common)
    }

}
