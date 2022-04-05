//
//  MoyeoRunViewController.swift
//  Moyeorun
//
//  Created by 마경미 on 2022/03/29.
//

import UIKit

class MoyeoRunRoomController: UIViewController {
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var informationView: UICollectionView!
    @IBOutlet var deadlineLabel: UILabel!
    
    @IBOutlet var hostImg: UIImageView!
    @IBOutlet var people2: UIImageView!
    @IBOutlet var people3: UIImageView!
    @IBOutlet var people4: UIImageView!
    let tipView = TipView(frame: CGRect(x: 100, y: 490, width: 15, height: 15))
    let tipView2 = TipView(frame:CGRect(x: 293, y: 650, width: 10, height: 10))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCornerRadius()
        setBorder()
        setTipView()
        view.addSubview(tipView)
        view.addSubview(tipView2)
    }
    
    func setCornerRadius(){
        let list = [descriptionLabel,informationView,deadlineLabel]
        for value in list {
            value?.layer.cornerRadius = 5
        }
    }
    
    func circleImg(){
        hostImg.layer.cornerRadius = hostImg.frame.height/2
        people2.layer.cornerRadius = people2.frame.height/2
        people3.layer.cornerRadius = people3.frame.height/2
        people4.layer.cornerRadius = people4.frame.height/2
    }
    
    func setBorder() {
        descriptionLabel.layer.borderColor = UIColor.systemGray4.cgColor
        descriptionLabel.layer.borderWidth = 1.0
    }
    
    func setTipView() {
        tipView.setColor(color: UIColor.systemGray6)
        tipView.transform = CGAffineTransform(rotationAngle: .pi/3 * 4.5)
        tipView.setBorder(color: UIColor.systemGray4)
        
        tipView2.setColor(color: UIColor.systemBlue)
        tipView2.transform = CGAffineTransform(rotationAngle: .pi)
    }
}

extension MoyeoRunRoomController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath)
        return cell
    }
}
