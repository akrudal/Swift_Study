//
//  PeopleNumPickerView.swift
//  Moyeorun
//
//  Created by 마경미 on 2022/03/27.
//

import UIKit

class PeopleNumPicker: UIPickerView {

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
