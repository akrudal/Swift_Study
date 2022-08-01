//
//  BarDetailView.swift
//  RunningTeam
//
//  Created by 마경미 on 2022/08/01.
//

import UIKit

class BarDetailView: UIView {

    let distanceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Pretendard-SemiBold", size: 16)
        label.textColor = UIColor(red: 0.067, green: 0.384, blue: 1, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let paceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Pretendard-SemiBold", size: 16)
        label.textColor = UIColor(red: 0.067, green: 0.384, blue: 1, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Pretendard-SemiBold", size: 16)
        label.textColor = UIColor(red: 0.067, green: 0.384, blue: 1, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func addLabel(with data: Running) {
        distanceLabel.text = data.distance+"km"
        addSubview(distanceLabel)
        distanceLabel.sizeToFit()
        distanceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        distanceLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
        
        paceLabel.text = data.pace
        addSubview(paceLabel)
        paceLabel.sizeToFit()
        paceLabel.leadingAnchor.constraint(equalTo: distanceLabel.trailingAnchor, constant: 20).isActive = true
        paceLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
        
        
        timeLabel.text = data.time
        addSubview(timeLabel)
        timeLabel.sizeToFit()
        timeLabel.leadingAnchor.constraint(equalTo: paceLabel.trailingAnchor, constant: 20).isActive = true
        timeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.isHidden = true
        self.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.isHidden = true
        self.backgroundColor = .white
    }
}
