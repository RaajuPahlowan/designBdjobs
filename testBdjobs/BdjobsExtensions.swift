//
//  BdjobsExtensions.swift
//  testBdjobs
//
//  Created by Fahim Mashroor on 27/11/25.
//

import Foundation
import UIKit
import Alamofire
import Toast_Swift
//import WSTagsField
//
//
//extension UIViewController {
//    func hideKeyboardWhenTappedAround() {
//        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
//        view.addGestureRecognizer(tap)
//    }
//
//    @objc func dismissKeyboard() {
//        view.endEditing(true)
//    }
//
//    func hideKeyboard()
//    {
//        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
//            target: self,
//            action: #selector(UIViewController.dismissKeyboard))
//
//        tap.cancelsTouchesInView = false
//        view.addGestureRecognizer(tap)
//    }


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
        var style = ToastStyle()
//        style.messageColor = .white()
//        style.backgroundColor = .black_767676()
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

//
//    func showActivityIndicator(activityIndicator: UIActivityIndicatorView, interactionDisabled: Bool) {
//        let container: UIView = UIView()
//        container.frame = self.view.frame
//        container.center = self.view.center
//        //container.backgroundColor = UIColor(red: 0 / 255.0, green: 0 / 255.0, blue: 0 / 255.0, alpha: 0.3)
//
//        let loadingView: UIView = UIView()
//        loadingView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width / 4 , height: self.view.frame.width / 4)
//        loadingView.center = self.view.center
//        loadingView.backgroundColor = UIColor(red: 68 / 255.0, green: 68 / 255.0, blue: 68 / 255.0, alpha: 0.7)
//        loadingView.clipsToBounds = true
//        loadingView.layer.cornerRadius = 10
//
//        activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
//        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.whiteLarge
//        activityIndicator.center = CGPoint(x: loadingView.frame.size.width / 2, y: loadingView.frame.size.height / 2)
//
//
//        if !activityIndicator.isAnimating {
//            activityIndicator.startAnimating()
//            if interactionDisabled {
//                activityIndicator.hidesWhenStopped = true
//                UIApplication.shared.beginIgnoringInteractionEvents()
//            }
//            loadingView.addSubview(activityIndicator)
//            container.addSubview(loadingView)
//            self.view.addSubview(container)
//        }
//    }
//
//    func hideActivityIndicator(activityIndicator: UIActivityIndicatorView) {
//        if activityIndicator.isAnimating {
//            guard let loadingView = activityIndicator.superview else {
//                UIApplication.shared.endIgnoringInteractionEvents()
//                return
//            }
//            let containerView = loadingView.superview
//            containerView?.removeFromSuperview()
//            activityIndicator.stopAnimating()
//            UIApplication.shared.endIgnoringInteractionEvents()
//        }
//    }
//
//    func showSystemActivityIndicator(activityIndicator: UIActivityIndicatorView) {
//        activityIndicator.center = self.view.center
//        activityIndicator.hidesWhenStopped = true
//        activityIndicator.activityIndicatorViewStyle = .gray
//        self.view.addSubview(activityIndicator)
//
//        activityIndicator.startAnimating()
//        UIApplication.shared.beginIgnoringInteractionEvents()
//    }
//
//    func hideSystemActivityIndicator(activityIndicator: UIActivityIndicatorView) {
//        activityIndicator.stopAnimating()
//        UIApplication.shared.endIgnoringInteractionEvents()
//    }
//
//    func showSimpleAlert(title: String, message: String) {
//        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//        self.present(alert, animated: true)
//    }
//
//    func showSimpleAlertHtml(parsedString: NSAttributedString, title: String) {
//        let alert = UIAlertController(title: title, message: "", preferredStyle: .alert)
//        alert.setValue(parsedString, forKey: "attributedMessage")
//        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//        self.present(alert, animated: true)
//    }
//
//    func showToast(message: String) {
//        var style = ToastStyle()
//        style.messageColor = .white()
//        style.backgroundColor = .black_767676()
//        self.view.makeToast(message, duration: 3.0, position: .bottom, style: style)
//        ToastManager.shared.style = style
//        ToastManager.shared.isTapToDismissEnabled = true
//        ToastManager.shared.isQueueEnabled = true
//    }
//
//    func showToast(message: String, position: ToastPosition) {
//        var style = ToastStyle()
//        style.messageColor = .white()
//        style.backgroundColor = .black_767676()
//        self.view.makeToast(message, duration: 3.0, position: position, style: style)
//        ToastManager.shared.style = style
//        ToastManager.shared.isTapToDismissEnabled = true
//        ToastManager.shared.isQueueEnabled = true
//    }
//
//    func showToastInfinite(message: String) {
//        var style = ToastStyle()
//        style.messageColor = .white()
//        style.backgroundColor = .black_767676()
//        self.view.makeToast(message, duration: .infinity, position: .bottom, style: style)
//        ToastManager.shared.style = style
//        ToastManager.shared.isTapToDismissEnabled = true
//        ToastManager.shared.isQueueEnabled = true
//    }
//
//    func presentRevealFromRight(_ viewControllerToPresent: UIViewController) {
//        let transition = CATransition()
//        transition.duration = 0.5
//        transition.type = kCATransitionFade
//        transition.subtype = kCATransitionFromRight
//        self.view.window!.layer.add(transition, forKey: kCATransition)
//        present(viewControllerToPresent, animated: false)
//    }
//
//    func presentPushFromRight(_ viewControllerToPresent: UIViewController) {
//        let transition = CATransition()
//        transition.duration = 0.5
//        transition.type = kCATransitionPush
//        transition.subtype = kCATransitionFromRight
//        guard let window = self.view.window else {
//            dismiss(animated: false)
//            return
//        }
//        window.layer.add(transition, forKey: kCATransition)
//        present(viewControllerToPresent, animated: false)
//    }
//
//    func dismissPushFromLeft() {
//        let transition = CATransition()
//        transition.duration = 0.5
//        transition.type = kCATransitionPush
//        transition.subtype = kCATransitionFromLeft
//        guard let window = self.view.window else {
//            dismiss(animated: false)
//            return
//        }
//        window.layer.add(transition, forKey: kCATransition) // issue
//        dismiss(animated: false)
//    }
//
//    func dismissFadeFromRight() {
//        let transition = CATransition()
//        transition.duration = 0.5
//        transition.type = kCATransitionFade
//        transition.subtype = kCATransitionFromRight
//        guard let window = self.view.window else {
//            dismiss(animated: false)
//            return
//        }
//        window.layer.add(transition, forKey: kCATransition)
//        self.dismiss(animated: false, completion: nil)
//    }
//
//    func backViewController() -> UIViewController? {
//        if let stack = self.navigationController?.viewControllers {
//            for i in 0..<stack.count {
//                if(stack[i] == self) {
//                    return stack[i-1]
//                }
//            }
//        }
//        return nil
//    }
//}
