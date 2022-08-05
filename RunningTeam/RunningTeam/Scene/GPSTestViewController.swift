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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager = CLLocationManager()
        locationManager.delegate = self
        
        // 정확도를 최고로 설정 => 배터리 관련하여 조절할 수 있음
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        // 앱이 suspend 상태일 때 위치정보를 수신받게 설정
        locationManager.allowsBackgroundLocationUpdates = true
        // location manager가 위치정보를 자동으로 일시정지 할 수 없게 설정
        locationManager.pausesLocationUpdatesAutomatically = false
        getLocationUsagePermission()
        
        myMapkit.delegate = self
        myMapkit.showsUserLocation = true
        
        locationManager.startUpdatingLocation()
    }
    
    
    @IBAction func stopUpdateLocation(_ sender: UIButton) {
        logger.debug("stop button touched")
        locationManager.stopUpdatingLocation()
    }
}

extension GPSTestViewController: CLLocationManagerDelegate, MKMapViewDelegate {
    
    func getLocationUsagePermission() {
        self.locationManager.requestAlwaysAuthorization()
    }
    
    // 애플리케이션 내에서 사용자 위치를 가져오기 위한 현재 위치 권한을 반환한다.
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
    
    func setAnnotation(latitude: CLLocationDegrees, longtitude: CLLocationDegrees, delta span: Double,
                       title strTitle: String, subtitle strSubTitle: String, pinColor color: UIColor) {
        let annotation = ColorPointAnnotation()
        annotation.coordinate = goLocation(latitude: latitude, longtitude: longtitude, delta: span)
        annotation.title = strTitle
        annotation.subtitle = strSubTitle
        annotation.pinTintColor = color
        myMapkit.addAnnotation(annotation)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let lastLocation = locations.last
        let latitude = (lastLocation?.coordinate.latitude)!
        let longtitude = (lastLocation?.coordinate.longitude)!
        
        logger.debug("latitude is \(latitude), longtitude is \(longtitude)")

//        let locationInfo: LocationInfo = LocationInfo()
//        locationInfo.id = locationInfo.autoIncrementKey()
//        locationInfo.latitude = String(format: "%.7f", latitude)
//        locationInfo.longtitude = String(format: "%.7f", longtitude)
        
        setAnnotation(latitude: latitude, longtitude: longtitude, delta: 0.05, title: "위치 감지", subtitle: "자동 감지", pinColor: UIColor.orange)
        // delta 값은 지도의 크기를 정한다. 값이 작을수록 확대하는 효과가 있다.
        _ = goLocation(latitude: latitude, longtitude: longtitude, delta: 0.01)
        
        // 다음 코드는 업데이트를 멈출 경우 사용한다.
        // locationManager.stopUpdatingLocation()
        
        // 내부 DB에 저장 코드 추후 작성
    }
    
    
    // 어떤 위치로든 위치 요청이 실패할 경우 호출된다.
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        logger.debug("mapView:viewFor:")
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "myAnnotation") as? MKPinAnnotationView
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "myAnnotation")
        } else {
            annotationView?.annotation = annotation
        }
        
        if let annotation = annotation as? ColorPointAnnotation {
            annotationView?.pinTintColor = annotation.pinTintColor
        }
        
        return annotationView
    }
}


class ColorPointAnnotation: MKPointAnnotation {
    var pinTintColor: UIColor?
}
