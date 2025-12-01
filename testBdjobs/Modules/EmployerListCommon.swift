//
//  EmployerListCommon.swift
//  testBdjobs
//
//  Created by Fahim Mashroor on 1/12/25.
//

import Foundation

struct EmployerListCommon : Codable {
    let totalrecordsfound : String?
    let totalpages : String?

    enum CodingKeys: String, CodingKey {

        case totalrecordsfound = "totalrecordsfound"
        case totalpages = "totalpages"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        totalrecordsfound = try values.decodeIfPresent(String.self, forKey: .totalrecordsfound)
        totalpages = try values.decodeIfPresent(String.self, forKey: .totalpages)
    }

}
