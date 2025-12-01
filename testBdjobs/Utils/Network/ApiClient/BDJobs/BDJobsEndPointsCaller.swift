//
//  BDJobsEndPointsCaller.swift
//  testBdjobs
//
//  Created by Raaju Pahlowan on 27/11/25.
//

import Foundation
import Alamofire

class BDJobsEndPointsCaller {
    
    static func getHotJobs(completion: @escaping (Result<HotJobsRoot>) -> Void) {
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
    
    
    static func getEmployerList(version: String, orgName: String, orgType: String, orgFirstLetter: String, encoded: String, pg: String, rpp: String, completion:@escaping (Result<EmployerListRoot>) -> Void) {
//        Alamofire.request(BDJobsEndPoints.employerList(version: version, orgName: orgName, orgType: orgType, orgFirstLetter: orgFirstLetter, encoded: encoded, pg: pg, rpp: rpp)).responseObject { (response: DataResponse<EmployerListRoot>) in
//            let request = response.request
//            let httpResponse = response.response
//            let statusCode = response.response?.statusCode
//            NetworkLog.showRequest(request: request!)
//            print("""
//                ***************************************
//                FUNCTION: \(#function), LINE: \(#line), CLASS : \(type(of: self))
//                ***************************************
//                """)
//            guard let statusCodeUnwrapped = statusCode else {
//                print(Constants.NetworkCallMessages.networkOperationFailed)
//                completion(response.result)
//                return
//            }
//
//            if 200 ... 300 ~= statusCodeUnwrapped {
//                //check bdjs response here
//                print(Constants.NetworkCallMessages.successAlamofire)
//                NetworkLog.showResponse(response: httpResponse!)
//                completion(response.result)
//                print(response)
//            } else {
//                print(Constants.NetworkCallMessages.failedAlamofire)
//                completion(response.result)
//            }
//        }
        
        Alamofire.request(BDJobsEndPoints.employerList(version: version, orgName: orgName, orgType: orgType, orgFirstLetter: orgFirstLetter, encoded: encoded, pg: pg, rpp: rpp))
            .responseObject { (response: DataResponse<EmployerListRoot>) in
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

                if 200...300 ~= statusCodeUnwrapped {
                    if let data = response.data, !data.isEmpty {
                        let result = DataRequest.serializeResponseData(response: response.response, data: data, error: response.error)
                        if case .success(let jsonData) = result {
                            let decoder = JSONDecoder()
                            do {
                                let employerListRoot = try decoder.decode(EmployerListRoot.self, from: jsonData)
                                completion(.success(employerListRoot))
                            } catch {
                                print("Failed to decode response: \(error)")
                                completion(.failure(error))
                            }
                        } else {
                            print("Empty data response")
                            completion(.failure(AFError.responseSerializationFailed(reason: .inputDataNilOrZeroLength)))
                        }
                    } else {
                        print("Empty data received")
                        completion(.failure(AFError.responseSerializationFailed(reason: .inputDataNilOrZeroLength)))
                    }
                } else {
                    print(Constants.NetworkCallMessages.failedAlamofire)
                    completion(response.result)
                }
            }

    }
}

