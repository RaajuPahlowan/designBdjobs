//
//  ViewController.swift
//  testBdjobs
//
//  Created by Fahim Mashroor on 24/11/25.
//

import UIKit

class HotJobsViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var companyTitleLabel: UILabel!
    @IBOutlet weak var companyLogoImageView: UIImageView!
    
    var hotJobsData = [HotJobsData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapImageView))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGesture)
        
        let TapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapLabel))
        textLabel.isUserInteractionEnabled = true
        textLabel.addGestureRecognizer(TapGesture)
    }
    
    func makeHotjobsNetworkCall() {
//        showActivityIndicator(activityIndicator: activityIndicator, interactionDisabled: true)
        BDJobsEndPointsCaller.getHotJobs() { result in
//            self.hideActivityIndicator(activityIndicator: self.activityIndicator)
//            if self.refreshControl.isRefreshing {
//                self.refreshControl.endRefreshing()
//            }
            switch result {
            case .success:
                guard let hotJobsRoot = result.value else {
                    self.showToast(message: Constants.NetworkCallMessages.generalError)
                    return
                }
                guard let hotJobsData = hotJobsRoot.data else {
                    self.showToast(message: Constants.NetworkCallMessages.generalError)
                    return
                }
                self.hotJobsData = hotJobsData
                print("yY! Success!!")
//                self.hotJobTableView.reloadData()
            case .failure:
                self.showToast(message: Constants.NetworkCallMessages.generalError)
                return
            }
        }
    }
    
    @objc func didTapLabel() {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let popupVC = storyboard.instantiateViewController(withIdentifier: "popupViewController") as! popupViewController
            
            popupVC.onTextSubmitted = { [weak self] text in
                self?.updateLabel(with: text)
            }
            popupVC.modalPresentationStyle = .overFullScreen
            popupVC.modalTransitionStyle = .crossDissolve
            self.present(popupVC, animated: true, completion: nil)
        }
    
    func updateLabel(with text: String) {
            textLabel.text = text
        }
    
    @objc func didTapImageView() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let popupVC = storyboard.instantiateViewController(withIdentifier: "popupViewController") as! popupViewController
        
        popupVC.onImageTapAction = { [weak self] in
            self?.navigateToFinalViewController()
        }
        popupVC.modalPresentationStyle = .overFullScreen
        popupVC.modalTransitionStyle = .crossDissolve
        self.present(popupVC, animated: true, completion: nil)
    }
    
    func navigateToFinalViewController() {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let finalVC = storyboard.instantiateViewController(withIdentifier: "finalViewController") as! finalViewController
        self.present(finalVC, animated: true, completion: nil)
        }
    
}
