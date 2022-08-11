//
//  GPSTestViewController.swift
//  RunningTeam
//
//  Created by 마경미 on 2022/08/05.
//

import UIKit
import MapKit
import OSLog
import CoreLocation

class GPSTestViewController: UIViewController {

    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longtitudeLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var paceLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var myMapkit: MKMapView!
    @IBOutlet weak var stopButton: UIButton!
    
    var locationManager: CLLocationManager!
    let logger = Logger()
    var totalDistance: Double = 0
    var startLocation: CLLocation!
    var preLocation: CLLocation!
    var startTime = Date()
    var timer: Timer?
 
    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.allowsBackgroundLocationUpdates = true
        locationManager.pausesLocationUpdatesAutomatically = false
        getLocationUsagePermission()
        myMapkit.delegate = self
        myMapkit.showsUserLocation = true
    }
    
    @objc func timerCallback() {
        let timeInterval = Date().timeIntervalSince(self.startTime)
        
        let minute = (Int)(timeInterval/60) // 초를 60으로 나누어 분을 구한다
        let second = (Int)(fmod(timeInterval, 60)) // 초를 구한다

        timeLabel.text = String(format:"%02d : %02d", minute, second)
        
        print(Int(timeInterval))
        paceLabel.text = String(1000/(Int(totalDistance)/Int(timeInterval)))
    }
    
    @IBAction func stopUpdateLocation(_ sender: UIButton) {
        logger.debug("stop button touched")
        locationManager.stopUpdatingLocation()
        timer!.invalidate()
    }
    
    @IBAction func startUpdateLocation(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCallback), userInfo: nil, repeats: true)
        startTime = Date()
        
        locationManager.startUpdatingLocation()
    }
}

extension GPSTestViewController: CLLocationManagerDelegate, MKMapViewDelegate {
    func getLocationUsagePermission() {
        self.locationManager.requestAlwaysAuthorization()
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways :
            print("GPS 권한 설정됨")
        case .authorizedWhenInUse, .restricted, .notDetermined:
            print("GPS 권한 설정되지 않음")
            getLocationUsagePermission()
        case .denied:
            print("GPS 권한 요청 거부됨")
            getLocationUsagePermission()
        default:
            print("GPS: Default")
        }
    }
    
    func goLocation(latitude: CLLocationDegrees, longtitude: CLLocationDegrees, delta span: Double) -> CLLocationCoordinate2D {
        let coordinate2D = CLLocationCoordinate2DMake(latitude, longtitude)
        let coordinateSpan = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        let coordinateRegion = MKCoordinateRegion(center: coordinate2D, span: coordinateSpan)
        
        myMapkit.setRegion(coordinateRegion, animated: true)
        return coordinate2D
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if startLocation == nil {
            startLocation = locations.first
        } else if let lastLocation = locations.last {
            let latitude = (lastLocation.coordinate.latitude)
            let longtitude = (lastLocation.coordinate.longitude)
            
            latitudeLabel.text = String(latitude)
            longtitudeLabel.text = String(longtitude)
            _ = goLocation(latitude: latitude, longtitude: longtitude, delta: 0.01)
            
            totalDistance += preLocation.distance(from: lastLocation)
            distanceLabel.text = String("\(totalDistance/1000)km")
        }
        
        preLocation = locations.last
    }
    
    
    // 어떤 위치로든 위치 요청이 실패할 경우 호출된다.
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        logger.debug("실패")
    }
}

