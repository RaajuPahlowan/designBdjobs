//
//  DeviceInformation.swift
//  testBdjobs
//
//  Created by Raaju Pahlowan on 27/11/25.
//

import Foundation
import UIKit

struct DeviceInformation {
    static func getAppBudleIdentifier() -> String {
        guard let bundleId = Bundle.main.bundleIdentifier else {
            return "com.bdjobs.iosapp"
        }
        return bundleId
    }
    
    static func getAppVersion() -> String? {
        let dictionary = Bundle.main.infoDictionary!
        guard let version = dictionary["CFBundleShortVersionString"] as? String else {
            return nil
        }
        guard let build = dictionary["CFBundleVersion"] as? String else {
            return nil
        }
        return version + "." + build
    }

}
