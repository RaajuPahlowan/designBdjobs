//
//  ViewController.swift
//  testBdjobs
//
//  Created by Raaju Pahlowan on 24/11/25.
//

import UIKit

class HotJobsViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var hotJobTableView: UITableView!
    
    var hotJobsData = [HotJobsData]()
    var selectedRow = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapImageView))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGesture)
        
        let TapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapLabel))
        textLabel.isUserInteractionEnabled = true
        textLabel.addGestureRecognizer(TapGesture)
        
        makeHotjobsNetworkCall()
        prepareTableview()
    }
    
    
    func prepareTableview() {
        hotJobTableView.estimatedRowHeight = 0
        hotJobTableView.estimatedSectionHeaderHeight = 0
        hotJobTableView.estimatedSectionFooterHeight = 0
        hotJobTableView.delegate = self
        hotJobTableView.dataSource = self
        hotJobTableView.tableFooterView = UIView()
    }
    
    func makeHotjobsNetworkCall() {
        BDJobsEndPointsCaller.getHotJobs() { result in
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
                print("yY! Success!!")
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

extension HotJobsViewController: UITableViewDelegate {

}

extension HotJobsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return hotJobsData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        let cell = tableView.dequeueReusableCell(withIdentifier: "HotJobsTableViewCell", for: indexPath) as! HotJobsTableViewCell
        let hotJob = hotJobsData[section]
        let companyName = hotJob.companyName
        cell.prepareView(hotJobsData: hotJob)
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
}
