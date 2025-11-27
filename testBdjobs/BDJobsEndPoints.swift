//
//  BDJobsEndPoints.swift
//  testBdjobs
//
//  Created by Fahim Mashroor on 27/11/25.
//

import Alamofire

enum BDJobsEndPoints: PApiConfiguration {


    case getHotJobs


    //MARK:- HTTPMethods
    var method: HTTPMethod {
        switch self {
        case .getHotJobs:
            return .get
        }
    }

    //MARK:- Path
    var path: String {
        switch self {
        case .getHotJobs:
            return "/apps/api/v1/HOTJOBXMLAutoTemplateNewOnline.asp"
        }
    }

    //MARK:- Parameters
    var parameters: Parameters? {
        switch self {
        case .getHotJobs:
            return [Constants.APIParameterKey.packageName: Constants.Others.packageName, Constants.APIParameterKey.packageNameVersion: Constants.Others.packageNameVersion, Constants.APIParameterKey.appId: Constants.Others.appId]
        }

    }

    //MARK:- URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try Constants.ProductionServer.bdjobsBaseURL.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))

        //HTTP Method
        urlRequest.httpMethod = method.rawValue

        //Common Headers
        //urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.url.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        urlRequest.timeoutInterval = Constants.DurationUtils.networkCallTimeOutInterval

        if let parameters = parameters {
            do {
                //urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
                urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
                print("url req: \(parameters)")
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        return urlRequest
    }

}
