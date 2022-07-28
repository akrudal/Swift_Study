//
//  BarCell.swift
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

class BarCell: UICollectionViewCell {
    
    static let barCellId: String = "barCell"
    
    var myDistance: String = ""
    var myPace: String = ""
    var myTime: String = ""
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    func setImageViewLayout() {
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        imageView.heightAnchor.constraint(equalTo: widthAnchor, constant: -20).isActive = true
    }
    
    func setImage(with imageName: String) {
        imageView.image = UIImage(named: imageName)
    }
    
    func setData(with data: Running) {
        myDistance = data.distance
        myPace = data.pace
        myTime = data.time
    }
    
    override init(frame:CGRect){
        super.init(frame:frame)
        addSubview(imageView)
        setImageViewLayout()
    }
    
    required init?(coder aDecoder : NSCoder) {
        super.init(coder : aDecoder)
    }
}
