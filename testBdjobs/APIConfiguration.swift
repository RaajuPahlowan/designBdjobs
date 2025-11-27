//
//  APIConfiguration.swift
//  testBdjobs
//
//  Created by Fahim Mashroor on 27/11/25.
//

import Foundation
import Alamofire

protocol PApiConfiguration: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
}
