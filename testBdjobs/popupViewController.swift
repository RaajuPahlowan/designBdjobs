//
//  popupViewController.swift
//  testBdjobs
//
//  Created by Raaju Pahlowan on 24/11/25.
//

import UIKit

class popupViewController: UIViewController {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var popupImageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    
    var onImageTapAction: (() -> Void)?
    var onTextSubmitted: ((String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
               mainView.layer.cornerRadius = 5
               view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
               
               let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onImageTap))
               popupImageView.isUserInteractionEnabled = true
               popupImageView.addGestureRecognizer(tapGesture)
               
               let backgroundTapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissModal(_:)))
               backgroundTapGesture.cancelsTouchesInView = false
               view.addGestureRecognizer(backgroundTapGesture)
               
               setupPopupConstraints()

        
    }
    
    func setupPopupConstraints() {
            mainView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                mainView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                mainView.widthAnchor.constraint(equalToConstant: 335),
                mainView.heightAnchor.constraint(equalToConstant: 290)
            ])
        }
    
    @objc func onImageTap() {
            print("It Works")
            dismiss(animated: true) { [weak self] in
                self?.onImageTapAction?()
            }
        }
    
    @objc func dismissModal(_ sender: UITapGestureRecognizer) {
            let location = sender.location(in: view)
            if !mainView.frame.contains(location) {
                self.dismiss(animated: true)
            }
        }
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        if let text = textField.text, !text.isEmpty {
                    dismiss(animated: true) { [weak self] in
                        self?.onTextSubmitted?(text) // Call the closure with the entered text
                    }
                }
    }
    
}
