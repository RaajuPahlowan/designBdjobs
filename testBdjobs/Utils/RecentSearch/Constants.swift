//
//  Constants.swift
//  testBdjobs
//
//  Created by Raaju Pahlowan on 27/11/25.
//

import UIKit

struct Constants {
    struct ProductionServer {
        static let bdjobsBaseURL = "https://jobs.bdjobs.com/"
        static let myBdjobsBaseUrl = "https://my.bdjobs.com/"
        static let myBdjobsImageBaseUrl = "https://my.bdjobs.com/photos/"
        static let networkCheckUrl = "https://www.wikipedia.org/"
    }
    
    struct APIParameterKey {
        
        static let packageName = "packageName"
        static let packageNameVersion = "packageNameVersion"
        static let appId = "appId"
        static let page = "page"
        static let rpp = "rpp"
        static let version = "version"
        static let encoded = "encoded"
        static let orgName = "orgName"
        static let orgType = "orgType"
        static let orgFirstLetter = "orgFirstLetter"
    }
        
        struct Others {
            static let packageName: String = {
                let packageName = DeviceInformation.getAppBudleIdentifier()
                return packageName
            }()
            static let packageNameVersion: String = {
                let packageNameVersion = DeviceInformation.getAppVersion()
                return packageNameVersion!
            }()
            static let appId = 3
            static let encoded: String = {
                let userDefaultManager = UserDefaultsManager()
                guard let encoded = userDefaultManager.getEncoded() else {
                            return "" // Default to empty string if nil
                        }
                        return encoded
            }()
        }
    
    
    struct NetworkCallMessages {
        static let successAlamofire = "SUCCESS FROM ALAMOFIRE"
        static let failedAlamofire = "FAILED FROM ALAMOFIRE"
        static let successBDJServer = "SUCCESS FROM BDJS"
        static let failedBDJServer = "FAILED FROM BDJS"
        static let networkOperationFailed = "NETWORK OPERATION FAILED"
        static let generalError = "System needs some time to work. Please try again later."
        static let internetConnectionNotFound = "Internet Connection Not Found"
    }
    
    struct DurationUtils {
        static let networkCallTimeOutInterval = 15.0
        static let resendCodeTimeLimit = 30
        static let animationDuration: TimeInterval = 0.25
        static let switchingInterval: TimeInterval = 3
    }
    
    struct WebViewUrls {
        static let hotJobsUrl = "http://bdjobs.com/upcoming/files/hotjob/apphotjobs.asp"
    }
    
    struct UserDefaultKey {
        static let lastUpdate = "lastUpdate"
        static let keyword = "keyword"
        static let location = "location"
        static let category = "category"

        static let keyword_recent_search_String = "keyword_recent_search_String"
        static let location_recent_search = "location_recent_search"
        static let lastSavedPosition = "lastSavedPosition"

        static let userData = "userData"
        static let isLoggedIn = "isLoggedIn"
        static let storedJob = "storedJob"
        static let appliedJobs = "appliedJobs"
        static let favoriteSearchList = "favoriteSearchList"
        static let favoriteSearchNames = "favoriteSearchNames"
        static let followEmployeersCompanyNames = "followEmployeersCompanyNames"
        static let followEmployers = "followEmployers"

        static let lastSearch = "lastSearch"
        static let lastFavSearchTitle = "lastFavSearchTitle"

        static let lastFavSearchId = "lastFavSearchId"

        static let encodedKey = "encodedKey"
    }
}


enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
    case url = "application/x-www-form-urlencoded"
}

enum HotJobsCardState {
    case folded
    case expanded
}
