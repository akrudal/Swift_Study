//
//  BarView.swift
//  RunningTeam
//
//  Created by 마경미 on 2022/07/22.
//

import UIKit

class BarView: UIView {
  
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    @IBInspectable var height: CGFloat = 356
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 99, height: height)
    }

    override func prepareForInterfaceBuilder() {
         invalidateIntrinsicContentSize()
    }

    func setHeight(varHeight: CGFloat) {
        height = varHeight
    }
    
    @objc func tappedBar(_ gesture: UITapGestureRecognizer) {
        print("hi")
    }
    
    func setImageViewLayout() {
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        imageView.heightAnchor.constraint(equalTo: widthAnchor, constant: -20).isActive = true
    }
    
    init(imageName: String) {
        super.init(frame: .zero)
        backgroundColor = .systemBlue
        imageView.image = UIImage(named: imageName)
        addSubview(imageView)
        setImageViewLayout()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
