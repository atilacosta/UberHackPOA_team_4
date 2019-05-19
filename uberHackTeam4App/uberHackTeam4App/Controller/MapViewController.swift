//
//  MapViewController.swift
//  uberHackTeam4App
//
//  Created by Atila Costa on 19/05/19.
//  Copyright © 2019 Atila Costa. All rights reserved.
//

import UIKit
import GoogleMaps
import SnapKit
import QRCodeReader
import AVFoundation


class MapViewController: UIViewController {
    
    var map: GMSMapView!
    var locationManager = CLLocationManager()
    
    @IBOutlet weak var creditsLabel: UILabel!
    
    @IBOutlet weak var mapView: UIView!
    
    @IBOutlet weak var ShopButton: UIButton! {
        didSet {
            ShopButton.layer.cornerRadius = ShopButton.frame.height / 2
            ShopButton.setTitle("$", for: .normal)
            ShopButton.layer.borderWidth = 2.0
            ShopButton.layer.borderColor = UIColor(red: 67.0/255.0, green: 198.0/255.0, blue: 158/255.0, alpha: 1.0).cgColor
        }
    }
    
    @IBAction func didPressShop(_ sender: Any) {
        self.performSegue(withIdentifier: Segues.presentShop.rawValue, sender: self)
    }
    
    @IBOutlet weak var QRCodeButton: UIButton! {
        didSet {
            QRCodeButton.layer.cornerRadius = QRCodeButton.frame.height / 2
            QRCodeButton.setTitle("Read QR", for: .normal)
        }
    }
    
    @IBAction func didPressQR(_ sender: Any) {
        self.present(readerVC, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        self.navigationItem.largeTitleDisplayMode = .always
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        setUpMap()
        
        self.readerVC.delegate = self
        
        AppProvider.shared.getUser { user in
            self.creditsLabel.text = String(format: "R$ %.2f", user.credits)
        }

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    func setUpMap() {
        let camera = GMSCameraPosition.camera(withLatitude:  -30.0277, longitude: -51.2287, zoom: 13.0)
        let map = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        map.isMyLocationEnabled = true
        map.tintColor = UIColor(red: 67.0/255.0, green: 198.0/255.0, blue: 158/255.0, alpha: 1.0)
        self.locationManager.delegate = self
        self.locationManager.startUpdatingLocation()
        
        // STYLE
        do {
            // Set the map style by passing the URL of the local file.
            if let styleURL = Bundle.main.url(forResource: "style", withExtension: "json") {
                map.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL)
            } else {
                NSLog("Unable to find style.json")
            }
        } catch {
            NSLog("One or more of the map styles failed to load. \(error)")
        }
        
        AppProvider.shared.getLocations { locations in
            locations.forEach({ location in
                let marker = GMSMarker()
                marker.icon = UIImage(named: "icon")
                marker.position = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
                marker.map = map
            })
        
        }
        
        mapView.addSubview(map)
        map.snp.makeConstraints { make in
            make.width.height.centerX.centerY.equalToSuperview()
        }
        
        self.map = map
    
    }
    
    lazy var readerVC: QRCodeReaderViewController = {
        let builder = QRCodeReaderViewControllerBuilder {
            $0.reader = QRCodeReader(metadataObjectTypes: [.qr], captureDevicePosition: .back)
            
            $0.showTorchButton        = false
            $0.showSwitchCameraButton = false
            $0.showCancelButton       = true
            $0.showOverlayView        = true
            $0.rectOfInterest         = CGRect(x: 0.2, y: 0.2, width: 0.6, height: 0.6)
        }
        
        return QRCodeReaderViewController(builder: builder)
    }()
    
    @IBAction func unwindToVC1(segue: UIStoryboardSegue) { }
    
}

extension MapViewController: QRCodeReaderViewControllerDelegate {
    
    func reader(_ reader: QRCodeReaderViewController, didScanResult result: QRCodeReaderResult) {
        reader.stopScanning()
        guard let resultValue = Double(result.value) else { return }
        AppProvider.shared.updateCredits(value: resultValue)
        dismiss(animated: true, completion: nil)
    }
    
    func reader(_ reader: QRCodeReaderViewController, didSwitchCamera newCaptureDevice: AVCaptureDeviceInput) {
        
    }
    
    func readerDidCancel(_ reader: QRCodeReaderViewController) {
        reader.stopScanning()
        
        dismiss(animated: true, completion: nil)
    }
    
}

extension MapViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations.last
        
        let camera = GMSCameraPosition.camera(withLatitude: (location?.coordinate.latitude)!, longitude: (location?.coordinate.longitude)!, zoom: 17.0)
        
        self.map.animate(to: camera)
        
        self.locationManager.stopUpdatingLocation()
        
    }
    
}
