//
//  MakeRoomButton.swift
//  Moyeorun
//
//  Created by 마경미 on 2022/04/18.
//

import UIKit

class MakeRoomButton: UIButton {
    required init(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)!
        self.setTitleColor(.lightGray, for: .normal)
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.7).cgColor
    }

}
