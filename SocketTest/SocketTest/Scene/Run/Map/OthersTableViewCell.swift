//
//  OthersTableViewCell.swift
//  SocketTest
//
//  Created by 마경미 on 2022/07/14.
//

import UIKit

class OthersTableViewCell: UITableViewCell {

    let nameLabel: UILabel = {
       let label = UILabel()
        return label
    }()
    
    let gpsStackView: UIStackView = {
        let stackView = UIStackView()
        return stackView
    }()
    
    func setData() {
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
