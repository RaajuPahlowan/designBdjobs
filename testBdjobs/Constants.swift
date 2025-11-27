//
//  Constants.swift
//  testBdjobs
//
//  Created by Fahim Mashroor on 27/11/25.
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
    }
        
        struct Others {
            //        static let staticEncoded = "150410BJJS261"
            //        static let encoded: String = {
            //            let userDefaultManager = UserDefaultsManager()
            //            let encoded = userDefaultManager.getEncoded()
            //            return encoded!
            //        }()
            static let packageName: String = {
                let packageName = DeviceInformation.getAppBudleIdentifier()
                return packageName
            }()
            static let packageNameVersion: String = {
                let packageNameVersion = DeviceInformation.getAppVersion()
                return packageNameVersion!
            }()
            static let appId = 3
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
