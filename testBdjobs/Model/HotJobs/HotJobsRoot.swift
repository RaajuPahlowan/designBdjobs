//
//  HotJobsRoot.swift
//  testBdjobs
//
//  Created by Raaju Pahlowan on 27/11/25.
//

import Foundation

struct HotJobsRoot: Codable {
    let statuscode : String?
    let message : String?
    let data : [HotJobsData]?

    enum CodingKeys: String, CodingKey {

        case statuscode = "statuscode"
        case message = "message"
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        statuscode = try values.decodeIfPresent(String.self, forKey: .statuscode)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        data = try values.decodeIfPresent([HotJobsData].self, forKey: .data)
    }
}

struct HotJobsData: Codable {
    let companyName : String?
    let logoSource : String?
    let jobTitles : [JobTitles]?

    enum CodingKeys: String, CodingKey {

        case companyName = "companyName"
        case logoSource = "logoSource"
        case jobTitles = "jobTitles"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        companyName = try values.decodeIfPresent(String.self, forKey: .companyName)
        logoSource = try values.decodeIfPresent(String.self, forKey: .logoSource)
        jobTitles = try values.decodeIfPresent([JobTitles].self, forKey: .jobTitles)
    }
}

struct JobTitles: Codable {
    let jobTitle : String?
    let linkPage : String?

    enum CodingKeys: String, CodingKey {

        case jobTitle = "jobTitle"
        case linkPage = "linkPage"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        jobTitle = try values.decodeIfPresent(String.self, forKey: .jobTitle)
        linkPage = try values.decodeIfPresent(String.self, forKey: .linkPage)
    }
}
