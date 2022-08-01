//
//  BarButton.swift
//  RunningTeam
//
//  Created by 마경미 on 2022/07/28.
//

import UIKit

struct Running {
    var distance: String
    var pace: String
    var time: String
}

class BarButton: UIButton {
    
    var myDistance: String = ""
    var myPace: String = ""
    var myTime: String = ""
    
    func setButtonImage(with imageName: String) {
        setImage(UIImage(named: imageName), for: .normal)
    }
    
    func setData(with data: Running) {
        myDistance = data.distance
        myPace = data.pace
        myTime = data.time
    }

    func setImageViewLayout() {
        // bottom edge insets 바꿔야 함. 계산 이후 수정하기
        self.contentEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: self.frame.size.height - self.frame.width + 5, right: 5)
        self.imageView?.layer.cornerRadius = (self.frame.width - 10) / 2
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    func setupView() {
        layer.masksToBounds = true
        clipsToBounds = true
        contentVerticalAlignment = .top
        backgroundColor = .systemBlue
        heightAnchor.constraint(equalToConstant: 356).isActive = true
    }
    
    func getMyData() -> Running {
        return Running(distance: myDistance, pace: myPace, time: myTime)
    }
}
