//
//  TrafficDetailTableViewCell.swift
//  WoolworthsiOSTest
//
//  Created by Tantia, H. on 2/03/2017.
//  Copyright © 2017 Kreativ Apps, LLC. All rights reserved.
//

import UIKit

class TrafficDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var criticalityLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!
    @IBOutlet weak var shortDescLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    private static var size: CGSize?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func pupulate(data: TRAFFICITEM) {
        let viewModel = TrafficDetailTableViewCellViewModel(withTrafficItem: data)
        
        self.backgroundColor = viewModel.color()
        self.criticalityLabel.text = viewModel.criticality()
        self.commentsLabel.text = viewModel.comments()
        self.statusLabel.text = viewModel.status()
        self.shortDescLabel.text = viewModel.shortDesc()
        self.descLabel.text = viewModel.desc()
    }
    
    class func sizeFromNib() -> CGSize {
        if size == nil {
            let nibNameString = "TrafficDetailTableViewCell"
            let view = UINib(nibName: nibNameString, bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! TrafficDetailTableViewCell
            size = view.bounds.size
            return view.bounds.size
        }
        return size!
    }
    
    static var identifier : String {
        let identifierString = NSStringFromClass(self.classForCoder()).components(separatedBy: ".").last!
        return identifierString
    }
}
