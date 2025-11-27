//
//  BDJobsEndPointsCaller.swift
//  testBdjobs
//
//  Created by Fahim Mashroor on 27/11/25.
//

import Foundation
import Alamofire

class BDJobsEndPointsCaller {
    
    static func getHotJobs(completion:@escaping (Result<HotJobsRoot>) -> Void) {
        Alamofire.request(BDJobsEndPoints.getHotJobs).responseObject { (response: DataResponse<HotJobsRoot>) in
            let request = response.request
            let httpResponse = response.response
            let statusCode = response.response?.statusCode
            NetworkLog.showRequest(request: request!)
            print("""
            ***************************************
            FUNCTION: \(#function), LINE: \(#line), CLASS : \(type(of: self))
            ***************************************
            """)
            guard let statusCodeUnwrapped = statusCode else {
                print(Constants.NetworkCallMessages.networkOperationFailed)
                completion(response.result)
                return
            }

            if 200 ... 300 ~= statusCodeUnwrapped {
                //check bdjs response here
                print(Constants.NetworkCallMessages.successAlamofire)
                NetworkLog.showResponse(response: httpResponse!)
                completion(response.result)
                print(response)
            } else {
                print(Constants.NetworkCallMessages.failedAlamofire)
                completion(response.result)
            }
        }
    }
}
