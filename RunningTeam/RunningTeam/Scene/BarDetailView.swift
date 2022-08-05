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
    
    let lineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBlue
        return view
    }()
    
    let lineView2: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBlue
        return view
    }()
    
    func addLabel(with data: Running) {
        distanceLabel.text = data.distance+"km"
        addSubview(distanceLabel)
        distanceLabel.sizeToFit()
        distanceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        distanceLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        addSubview(lineView)
        lineView.widthAnchor.constraint(equalToConstant: 1).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        lineView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        lineView.leadingAnchor.constraint(equalTo: distanceLabel.trailingAnchor, constant: 15).isActive = true
        
        paceLabel.text = data.pace
        addSubview(paceLabel)
        paceLabel.sizeToFit()
        paceLabel.leadingAnchor.constraint(equalTo: lineView.trailingAnchor, constant: 15).isActive = true
        paceLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        addSubview(lineView2)
        lineView2.widthAnchor.constraint(equalToConstant: 1).isActive = true
        lineView2.heightAnchor.constraint(equalToConstant: 20).isActive = true
        lineView2.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        lineView2.leadingAnchor.constraint(equalTo: paceLabel.trailingAnchor, constant: 15).isActive = true
        
        timeLabel.text = data.time
        addSubview(timeLabel)
        timeLabel.sizeToFit()
        timeLabel.leadingAnchor.constraint(equalTo: lineView2.trailingAnchor, constant: 15).isActive = true
        timeLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.isHidden = true
        self.backgroundColor = .white
        self.layer.cornerRadius = 4
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.isHidden = true
        self.backgroundColor = .white
        self.layer.cornerRadius = 4
    }
}
