//
//  FollowEmployeeListTableViewCell.swift
//  testBdjobs
//
//  Created by Fahim Mashroor on 1/12/25.
//

import UIKit

class FollowEmployeeListTableViewCell: UITableViewCell {
    @IBOutlet weak var companyTitleLabel: UILabel!
    @IBOutlet weak var jobCountLabel: UILabel!
    @IBOutlet weak var followButton: UIButton!
    
    @IBAction func onClickUnFollowButton(_ sender: Any) {
        if let onUnfollowButtonTapped = self.onUnfollowButtonTapped {
            onUnfollowButtonTapped()
        }
    }
    
    var onUnfollowButtonTapped : (() -> Void)? = nil
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func bindData(employerData: EmployerListData) {
        companyTitleLabel.text = employerData.companyName
        jobCountLabel.text = employerData.jobCount
    }

}
