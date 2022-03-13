//
//  BestHeader.swift
//  delivery5
//
//  Created by 마경미 on 2022/03/13.
//

import UIKit

class BestHeader : UICollectionReusableView {
    static let bestHeaderId = "bestHeaderId"
    let label = UILabel()
    override init(frame:CGRect){
        super.init(frame: frame)
        label.text="SNS에서 뜨는 맛집!"
        
        addSubview(label)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
}
