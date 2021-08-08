//
//  mapViewController.swift
//  PHVaccinationCampaign
//
//  Created by Antoinette Marie Torres on 8/7/21.
//

import CoreLocation
import MapKit
import UIKit

class mapViewController: UIViewController {
    
    private let map: MKMapView = {
        let map = MKMapView()
        return map
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(map)
        title = "Home"
        
        LocationManager.shared.getuserLocation { [weak self] location in DispatchQueue.main.async {
            guard let strongSelf = self else {
                return
            }
            strongSelf.addMapPin(with: location)
            
            }
        }
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: 14.6542, longitude: 121.0247)
        map.addAnnotation(annotation)
        annotation.title = "Vaccination Center: Estaban Abada Elementary School"
        
        let annotation2 = MKPointAnnotation()
        annotation2.coordinate = CLLocationCoordinate2D(latitude: 14.6892, longitude: 121.0950)
        map.addAnnotation(annotation2)
        annotation2.title = "Vaccination Center: Batasan Hills National High School"
        
        let annotation3 = MKPointAnnotation()
        annotation2.coordinate = CLLocationCoordinate2D(latitude: 14.6172, longitude: 121.0633)
        map.addAnnotation(annotation2)
        annotation3.title = "Vaccination Center: Emilio Aguinaldo Elementary School"
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        map.frame = view.bounds
    }
    
    func addMapPin(with location: CLLocation) {
        let pin = MKPointAnnotation()
        pin.coordinate = location.coordinate
        map.setRegion(MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 40, longitudeDelta: 40)), animated: true)
        map.addAnnotation(pin)
        
        LocationManager.shared.resolveLocationName(with: location) { [weak self]
            locationName in self?.title = locationName
        }
    }

}
