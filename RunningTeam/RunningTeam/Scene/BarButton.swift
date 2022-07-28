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
        imageView?.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        imageView?.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        imageView?.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        imageView?.heightAnchor.constraint(equalTo: widthAnchor, constant: -20).isActive = true
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
        layer.cornerRadius = 4
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        clipsToBounds = true
    }
    
    func getMyData() -> Running {
        return Running(distance: myDistance, pace: myPace, time: myTime)
    }
}
