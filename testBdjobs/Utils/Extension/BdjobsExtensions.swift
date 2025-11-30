//
//  BdjobsExtensions.swift
//  testBdjobs
//
//  Created by Raaju Pahlowan on 27/11/25.
//

import Foundation
import UIKit
import Alamofire
import Toast_Swift


extension UIViewController{
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    func hideKeyboard()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))

        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    func showToast(message: String) {
        let style = ToastStyle()

        self.view.makeToast(message, duration: 3.0, position: .bottom, style: style)
        ToastManager.shared.style = style
        ToastManager.shared.isTapToDismissEnabled = true
        ToastManager.shared.isQueueEnabled = true
    }
}

extension DataRequest{
    /// @Returns - DataRequest
    /// completionHandler handles JSON Object T
    @discardableResult func responseObject<T: Decodable> (
        queue: DispatchQueue? = nil ,
        completionHandler: @escaping (DataResponse<T>) -> Void ) -> Self{

        let responseSerializer = DataResponseSerializer<T> { request, response, data, error in
            guard error == nil else {return .failure(AFError.responseSerializationFailed(reason: .inputDataNil))}

            let result = DataRequest.serializeResponseData(response: response, data: data, error: error)
            guard case let .success(jsonData) = result else{
                return .failure(AFError.responseSerializationFailed(reason: .inputDataNil))
            }

            // (1)- Json Decoder. Decodes the data object into expected type T
            // throws error when failes
            let decoder = JSONDecoder()
            guard let responseObject = try? decoder.decode(T.self, from: jsonData)else{
                return .failure(AFError.responseSerializationFailed(reason: .inputDataNilOrZeroLength))
            }
            return .success(responseObject)
        }
        return response(queue: queue, responseSerializer: responseSerializer, completionHandler: completionHandler)
    }
}
