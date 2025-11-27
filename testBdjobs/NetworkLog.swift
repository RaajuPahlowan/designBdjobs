//
//  NetworkLog.swift
//  testBdjobs
//
//  Created by Fahim Mashroor on 27/11/25.
//

import Foundation

import Alamofire

struct NetworkLog {
    //show request information e.g body, method, url
    static func showRequest(request: URLRequest) {
        print("***************************************")
        print("REQUEST")
        print("***************************************")
        print("HTTP BODY")
        if let httpBody = request.httpBody {
            print(NSString(data: httpBody, encoding: String.Encoding.utf8.rawValue)!)
        } else {
            print("body nil")
        }
        print("***************************************")
        print("HTTP METHOD")
        print(request.httpMethod!)
        print("***************************************")
        print("URL")
        print(request.url!)
        print("***************************************")
    }

    static func showResponse(response: HTTPURLResponse) {
        print("***************************************")
        print("RESPONSE")
        print("***************************************")
        print("STATUS CODE")
        print(response.statusCode)
        print("***************************************")
    }
}
