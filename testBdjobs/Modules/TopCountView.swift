////
////  TopCountView.swift
////  testBdjobs
////
////  Created by Raaju Pahlowan on 1/12/25.
////
//
//import UIKit
//
//class TopCountView: UIView {
//
//    @IBOutlet var contentView: UIView!
//    @IBOutlet weak private var countInfoLabel: UILabel!
//
//    private var countInfoText = "Loading..."
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        commonInit()
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        commonInit()
//    }
//
//    private func commonInit() {
//        Bundle.main.loadNibNamed("TopCountView", owner: self, options: nil)
//        addSubview(contentView)
//        contentView.frame = self.bounds
//        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
//        countInfoLabel.text = countInfoText
//    }
//
//    func setCountInfoText(count: Int, singularText: String, pluralText: String) {
//        countInfoText = count > 1 ? "\(count) \(pluralText)" : "\(count) \(singularText)"
//        countInfoLabel.text = countInfoText
//    }
//
//    func getCountInfoText() -> String {
//        return countInfoText
//    }
//
//}
