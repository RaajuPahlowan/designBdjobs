//
//  HotJobsTableViewCell.swift
//  testBdjobs
//
//  Created by Fahim Mashroor on 29/11/25.
//

import UIKit
import AlamofireImage

class HotJobsTableViewCell: UITableViewCell {

    @IBOutlet weak var companyTitleLabel: UILabel!
    @IBOutlet weak var companyLogoImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        companyTitleLabel.text = nil
        companyLogoImageView.image = nil
    }
    
    func prepareView(hotJobsData: HotJobsData) {
        let companyName = hotJobsData.companyName
        let companyLogoSource = hotJobsData.logoSource
        if let companyLogoSourceUnwraped = companyLogoSource {
            let companyLogoSourceTrimmed = companyLogoSourceUnwraped.trimmingCharacters(in: .whitespacesAndNewlines)
            if let companyLogoUrl = URL(string: companyLogoSourceTrimmed) {
                let filter = AspectScaledToFitSizeFilter(size: (companyLogoImageView.frame.size))
                companyLogoImageView.af_setImage(withURL: companyLogoUrl, placeholderImage: nil, filter: filter)
            } else {
            }
        }
        companyTitleLabel.text = companyName
    }
    
    
    func prepareJobTitlesView(hotJobsData: HotJobsData, hotJobsCardState: HotJobsCardState) -> Int {
        let titles = hotJobsData.jobTitles
        let y = 0
        let loopBound = 0

        for i in 0..<loopBound {
            let title = titles![i]
            let titleLabel = UILabel()

            titleLabel.text = title.jobTitle
        }
        return y 
    }
    
}
