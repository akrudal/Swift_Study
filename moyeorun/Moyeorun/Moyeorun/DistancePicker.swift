//
//  DistancePickerView.swift
//  Moyeorun
//
//  Created by 마경미 on 2022/03/27.
//

import UIKit

class DistancePicker: UIPickerView {
    
    let KMLabel: UILabel = {
        let label = UILabel()
        label.text = "KM"
        label.font = label.font.withSize(20)
        label.sizeToFit()
        return label
    }()
    
    convenience init(value : Bool) {
        self.init(frame: CGRect.zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
