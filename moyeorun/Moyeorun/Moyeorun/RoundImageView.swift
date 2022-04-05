//
//  RoundImageView.swift
//  Moyeorun
//
//  Created by 마경미 on 2022/03/31.
//

import UIKit

class RoundImageView: UIImageView {
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 5.0
        self.clipsToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
  
    }
    
    private func loadView() {
        let view = Bundle.main.loadNibNamed("RoundImageView", owner: self, options: nil)?.first as! UIImageView
        view.frame = bounds
        addSubview(view)
        
    }
}
