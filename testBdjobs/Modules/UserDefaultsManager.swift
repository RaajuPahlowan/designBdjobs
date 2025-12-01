//
//  UserDefaultsManager.swift
//  testBdjobs
//
//  Created by Fahim Mashroor on 1/12/25.
//

import Foundation

struct UserDefaultsManager {
    var defaults: UserDefaults?
    
    init() {
        defaults = UserDefaults.standard
    }
    
    func getLastUpdateDate() -> Any? {
        let value = defaults?.string(forKey: Constants.UserDefaultKey.lastUpdate)
        if value == nil {
            return "10/12/1992 3:08:00 AM"
        }
        return value
    }
    
    func setValue(key: String, value: Any){
        defaults?.set(value, forKey: key)
    }
    
    func setEncoded(encoded: String) {
        let defaults = UserDefaults.standard
        defaults.set(encoded, forKey: Constants.UserDefaultKey.encodedKey)
    }
    
    func getEncoded() -> String? {
        let defaults = UserDefaults.standard
        guard let encoded = defaults.string(forKey: Constants.UserDefaultKey.encodedKey) else {
            return nil
        }
        return encoded
    }
    
//    func setFollowEmployerData(followEmployer: [FollowedEmployerListData]) {
//        let encoder = JSONEncoder()
//        if let encoded = try? encoder.encode(followEmployer) {
//            UserDefaults.standard.set(encoded, forKey: Constants.UserDefaultKey.followEmployers)
//        }
//    }
    
//    func getFollowEmployerData() -> [FollowedEmployerListData]? {
//        if let objects = UserDefaults.standard.value(forKey: Constants.UserDefaultKey.followEmployers) as? Data {
//            let decoder = JSONDecoder()
//            if let objectsDecoded = try? decoder.decode([FollowedEmployerListData].self, from: objects) {
//                return objectsDecoded
//            } else {
//                return nil
//            }
//        } else {
//            return nil
//        }
//    }
    
    func clearFollowedEmployerData() {
        defaults?.removeObject(forKey: Constants.UserDefaultKey.followEmployers)
    }

    func clearFollowEmployeerCompanyName() {
        defaults?.removeObject(forKey: Constants.UserDefaultKey.followEmployeersCompanyNames)
    }
}
