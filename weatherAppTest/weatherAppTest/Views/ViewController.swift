//
//  ViewController.swift
//  weatherAppTest
//
//  Created by Александр Воробей on 17.01.2022.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var locationNameLabel: UILabel!
    @IBOutlet weak var hightTempLabel: UILabel!
    @IBOutlet weak var lowTempLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    private let locationManager = CLLocationManager()
    private var currentLocation: CLLocation?
    
    var viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLocationManager()
    }
    
    // MARK: - Setup location and fetch weather
    private func setupLocationManager() {
        locationManager.delegate = self
        //locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    private func setupUI() {
        currentTempLabel.text = viewModel.currentTempString
        locationNameLabel.text = viewModel.locationNameString
        descriptionLabel.text = viewModel.descriptionString
        hightTempLabel.text = viewModel.hightTempString
        lowTempLabel.text = viewModel.lowTempString
    }
    
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if !locations.isEmpty, currentLocation == nil {
            currentLocation = locations.first
            locationManager.stopUpdatingLocation()
            guard let currentLocation = currentLocation else { return }
            let lat = currentLocation.coordinate.latitude
            let lon = currentLocation.coordinate.longitude
            viewModel.getWeather(lat: lat, lon: lon) {
                DispatchQueue.main.async {
                    self.setupUI()
                }
            }
            print(currentLocation.coordinate.latitude)
        }
    }
}
