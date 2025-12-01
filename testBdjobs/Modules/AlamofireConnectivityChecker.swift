//
//  AlamofireConnectivityChecker.swift
//  testBdjobs
//
//  Created by Fahim Mashroor on 1/12/25.
//

import Foundation
import Alamofire

class AlamofireConnectivityChecker: ConnectivityCheckable {
    func isNetworkReachable() -> Bool {
        guard let networkReachabilityManager = NetworkReachabilityManager() else {
            return false
        }
        return networkReachabilityManager.isReachable
    }
}
