//
//  EmployerListViewController.swift
//  testBdjobs
//
//  Created by Fahim Mashroor on 1/12/25.
//

import UIKit

class EmployerListViewController: UIViewController{
    
    @IBOutlet weak var employerListTableView: UITableView!
    
    var employerList = [EmployerListData]()
    var employerListCommon: EmployerListCommon?
    var currentPage = 1
    var searchQuery = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareTableview()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let networkStatusChecker: ConnectivityCheckable = AlamofireConnectivityChecker()
        if networkStatusChecker.isNetworkReachable() {
            getEmployerListFromServer(version: "", orgName: "", orgType: "", orgFirstLetter: "", encoded: Constants.Others.encoded, pg: "\(currentPage)", rpp: "10")
        } else {
            showToast(message: Constants.NetworkCallMessages.internetConnectionNotFound)
        }
    }
    
    func prepareTableview() {
        employerListTableView.delegate = self
        employerListTableView.dataSource = self
    }
    
    
    func getEmployerListFromServer(version: String, orgName: String, orgType: String, orgFirstLetter: String, encoded: String, pg: String, rpp: String) {
            BDJobsEndPointsCaller.getEmployerList(version: version, orgName: orgName, orgType: orgType, orgFirstLetter: orgFirstLetter, encoded: encoded, pg: pg, rpp: rpp) { (result) in
                switch result {
                case .success:
                    guard let employerListRoot = result.value else {
                        return
                    }
                    guard let employerList = employerListRoot.data else {
                        return
                    }
                    guard let employerListCommon = employerListRoot.common else {
                        return
                    }
                    self.employerList += employerList
                    self.employerListCommon = employerListCommon
                    self.employerListTableView.reloadData()
                    return

                case .failure:
                    self.showToast(message: Constants.NetworkCallMessages.generalError)
                    return
                }
            }
        }
    
}


extension EmployerListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let employer = self.employerList[indexPath.section]
        let jobCount = employer.jobCount
        if jobCount != "0" {
            guard let companyId = employer.companyID, let comapnyName = employer.companyName else {
                return
            }
            print("Navigate to company jobs view!")
        }
    }
}
    
    

extension EmployerListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FollowEmployeeListTableViewCell", for: indexPath) as! FollowEmployeeListTableViewCell
        let employer = employerList[indexPath.section]
        
        // Display employer data in cell
        cell.companyTitleLabel.text = employer.companyName
        cell.jobCountLabel.text = "Jobs: \(employer.jobCount)"
        
        cell.followButton.setTitle("Follow", for: .normal)
        cell.followButton.tag = 0
        
        cell.followButton.addTarget(self, action: #selector(toggleFollowButton(_:)), for: .touchUpInside)
        cell.followButton.tag = indexPath.section
        
        cell.bindData(employerData: employer)
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return employerList.count
    }


    
    @objc func toggleFollowButton(_ sender: UIButton) {
        let section = sender.tag
        let employer = employerList[section]
        
        if sender.tag == 0 {
            sender.setTitle("Unfollow", for: .normal)
            sender.tag = 1  // Set to "Unfollow"
            print("Followed \(employer.companyName ?? "")")
        } else {
            sender.setTitle("Follow", for: .normal)
            sender.tag = 0  // Set to "Follow"
            print("Unfollowed \(employer.companyName ?? "")")
        }
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 2.5
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
}

extension EmployerListViewController: UISearchBarDelegate {

}


