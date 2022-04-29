//
//  ViewController.swift
//  mapkitTest
//
//  Created by 조재영 on 2022/03/20.
//

import UIKit
import MapKit
import CoreLocation
import CoreMotion

class ViewController: UIViewController {

    @IBOutlet var remainTimeView: UIView!
    @IBOutlet var remainTimeLabel: UILabel!
    @IBOutlet var myImage: UIImageView!
    @IBOutlet weak var mapView: MapKitView!
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    
    @IBOutlet var liveView: UIView!
    @IBOutlet var liveButton: UIButton!
    
    @IBOutlet var heightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.configure(with: UIColor.green)
        setShadow()
  }
    func setShadow() {
        button1.layer.shadowOpacity = 0.25
        button1.layer.shadowOffset = CGSize(width: 0, height: 1)
        button1.layer.shadowRadius = 4
        button1.layer.masksToBounds = false

        button2.layer.shadowOpacity = 0.25
        button2.layer.shadowOffset = CGSize(width: 0, height: 1)
        button2.layer.shadowRadius = 4
        button2.layer.masksToBounds = false
    }
  
    @IBAction func clickLive(_ sender: Any) {
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       options: .curveEaseIn,
                       animations: { () -> Void in
            self.heightConstraint.constant = 170
            self.view.layoutIfNeeded()
        },
                       completion: { (didFinish) -> Void in
        })
    }
}

