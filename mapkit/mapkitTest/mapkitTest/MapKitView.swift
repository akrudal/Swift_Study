//
//  MapKitView.swift
//  MoyeoRun
//
//  Created by 조재영 on 2022/03/29.
//
import UIKit
import MapKit
import CoreLocation
import CoreMotion

class MapKitView: MKMapView {
    @IBOutlet weak var mapView: MKMapView!

    private var previousCoordinate: CLLocationCoordinate2D?
    private var locationManager = CLLocationManager()
    private var currentLocation: CLLocation?
    private let motionManager = CMMotionActivityManager()

    private var distance = 0
    private var myColor = UIColor()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpXib()
    }

    private func setUpXib() {
        // 메타데이터 스트링화
        let name = String(describing: Self.self)
        // nib 파일 만듬
        let nib = UINib(nibName: name, bundle: nil)

        // 인스턴스화
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else {
            fatalError("failed to instantiate MapKitView")
        }

        view.frame = self.bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpXib()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setUpXib()
    }

    func configure(with color: UIColor) {
        self.mapView.mapType = MKMapType.standard
        self.mapView.showsUserLocation = true
        self.mapView.setUserTrackingMode(.follow, animated: true)
        mapView.delegate = self
        myColor = color
        // 현재위치 색상 바꾸기
        mapView.tintColor = myColor
        locationManager.delegate = self
        // 정확도를 최고로 설정
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        // 위치 데이터를 추적하기 위해 사용자에게 승인 요구
        locationManager.requestWhenInUseAuthorization()
        // 위치 업데이트를 시작
        locationManager.startUpdatingLocation()
    }
}

extension MapKitView: CLLocationManagerDelegate {
    // 위도와 경도, 스팬(영역 폭)을 입력받아 지도에 표시
    func goLocation(
        latitudeValue: CLLocationDegrees,
        longtudeValue: CLLocationDegrees,
        delta span: Double
    ) -> CLLocationCoordinate2D {
        let location = CLLocationCoordinate2DMake(latitudeValue, longtudeValue)
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        let region = MKCoordinateRegion(center: location, span: spanValue)
        mapView.setRegion(region, animated: true)
        return location
    }

    func setAnnotation(
        latitudeValue: CLLocationDegrees,
        longitudeValue: CLLocationDegrees,
        delta span: Double,
        title strTitle: Int
    ) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = goLocation(latitudeValue: latitudeValue, longtudeValue: longitudeValue, delta: span)

        annotation.title = "\(strTitle) m"
        mapView.addAnnotation(annotation)
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let latitude = location.coordinate.latitude
        let longtitude = location.coordinate.longitude
        
        let range = 10.0
        let centerRange = CLLocationCoordinate2DMake(latitude, longtitude)
        let myRange = CLCircularRegion(center: CLLocationCoordinate2D(latitude: centerRange.latitude, longitude: centerRange.longitude), radius: range, identifier: "myRange")
        locationManager.startUpdatingLocation()
        locationManager.startMonitoring(for: myRange)
//        let circleRange = MKCircle(center: centerRange, radius: range)

        if let previousCoordinate = self.previousCoordinate {
            var points: [CLLocationCoordinate2D] = []
            let point1 = CLLocationCoordinate2DMake(previousCoordinate.latitude, previousCoordinate.longitude)
            let point2 = CLLocationCoordinate2DMake(latitude, longtitude)
            points.append(point1)
            points.append(point2)
            let lineDraw = MKPolyline(coordinates: points, count: points.count)

            let distancePoint1 = CLLocation(
                latitude: previousCoordinate.latitude,
                longitude: previousCoordinate.longitude)

            let distancePoint2 = CLLocation(latitude: latitude, longitude: longtitude)

            distance += Int(distancePoint2.distance(from: distancePoint1))
            if distance % 1000 == 0 {
                setAnnotation(latitudeValue: latitude, longitudeValue: longtitude, delta: 0.001, title: distance)
            }
            self.mapView.addOverlay(lineDraw)
        }
        self.previousCoordinate = location.coordinate
    }
}

extension MapKitView: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if let polyline = overlay as? MKPolyline {
             let renderer = MKPolylineRenderer(polyline: polyline)
            renderer.strokeColor = myColor
            renderer.fillColor = myColor
            renderer.lineWidth = 1.0
            renderer.alpha = 1.0
            return renderer
         }
         else if let circle = overlay as? MKCircle {
             let renderer = MKCircleRenderer(circle: circle)
             renderer.strokeColor = myColor
             renderer.fillColor = myColor.withAlphaComponent(0.3)
             renderer.lineWidth = 1.0
             return renderer
         } else {
             fatalError()
         }
    }
}
