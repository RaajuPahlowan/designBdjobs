//
//  HotJobsViewController.swift
//  testBdjobs
//
//  Created by Fahim Mashroor on 27/11/25.
//

import UIKit

class HotJobsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

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
                self.hotJobTableView.reloadData()
            case .failure:
                self.showToast(message: Constants.NetworkCallMessages.generalError)
                return
            }
        }
    }
}
