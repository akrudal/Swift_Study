//
//  ViewController.swift
//  RunningTeam
//
//  Created by 마경미 on 2022/07/22.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    var locataionManager: CLLocationManager!
    @IBOutlet weak var barStackView: UIStackView!
    
    let dataCount: Int = 4
    let imageNames: [String] = ["karina.jpeg","ningning.jpeg","winter.jpeg","giselle.jpeg"]
    let runningInfo: [Running] = [
        Running(distance: "1.5",pace: "6'66''",time: "03:06"),
        Running(distance: "1.5",pace: "6'66''",time: "03:06"),
        Running(distance: "1.5",pace: "6'66''",time: "03:06"),
        Running(distance: "1.5",pace: "6'66''",time: "03:06")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        makeBars()
        locataionManager = CLLocationManager()
        locataionManager.delegate = self
        // 배터리 수명에 영햐을 줌
        locataionManager.desiredAccuracy = kCLLocationAccuracyBest
        locataionManager.requestAlwaysAuthorization()
        locataionManager.requestWhenInUseAuthorization()
        locataionManager.startUpdatingLocation()
        
        // locationManager.stopUpdatingLocation()
    }
    
    @objc func onClick(sender: BarButton!) {
        for case let i as BarButton in barStackView.arrangedSubviews {
            i.myView.isHidden = true
        }
        
        sender.myView.isHidden = false
    }
    
    func makeBars() {
        for i in 1...dataCount {
            let button = BarButton()
            button.setButtonImage(with: imageNames[i-1])
            button.setData(with: runningInfo[i-1])
            button.addTarget(self, action: #selector(onClick), for: .touchUpInside)
            barStackView.addArrangedSubview(button)
        }
        barStackView.layoutIfNeeded()
        for case let i as BarButton in barStackView.arrangedSubviews {
            i.layer.cornerRadius = i.frame.size.width / 2
            i.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
            i.setImageViewLayout()
            
            let detailView = BarDetailView()
            detailView.addLabel(with: i.getMyData())
            view.addSubview(detailView)
            detailView.translatesAutoresizingMaskIntoConstraints = false
            detailView.widthAnchor.constraint(equalToConstant: 240).isActive = true
            detailView.topAnchor.constraint(equalTo: i.topAnchor, constant: 100).isActive = true
            detailView.centerXAnchor.constraint(equalTo: i.centerXAnchor).isActive = true
            detailView.heightAnchor.constraint(equalToConstant: 50).isActive = true
            
            i.setmyView(view: detailView)
        }
    }
}

extension ViewController: CLLocationManagerDelegate {
    
    // requestLocation()을 이용한 이후 한 번 호출된다.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            let latitude = location.coordinate.latitude
            let longtitude = location.coordinate.longitude
            print(latitude, longtitude)
            
//            // Altitude
//            let altitude = location.altitude
//
//            // Speed
//            let speed = location.speed
//
//            // Course, degrees relative to due north
//            let source = location.course
//
//            // Distance between two CLLocation
//            // Given another CLLocation, otherLocation
//            let distance = location.distance(from: otherLocation)
        }
    }
    
    
    
    // 어떤 위치로든 위치 요청이 실패할 경우 호출된다.
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
    }
    
    // 애플리케이션 내에서 사용자 위치를 가져오기 위한 현재 위치 권한을 반환한다.
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        //location5
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            print("GPS 권한 설정됨")
        case .restricted, .notDetermined:
            print("GPS 권한 설정되지 않음")
        case .denied:
            print("GPS 권한 요청 거부됨")
        default:
            print("GPS: Default")
        }
    }
    
    
}
