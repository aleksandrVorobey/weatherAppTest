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
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let locationManager = CLLocationManager()
    private var currentLocation: CLLocation?
    
    var viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        setupLocationManager()
        setupTableView()
        setupCollectionView()
    }
    
// MARK: - Setup tableView and collectionView
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(DailyTableViewCell.nib(), forCellReuseIdentifier: DailyTableViewCell.identifier)
    }
    
    private func setupCollectionView() {
        collectionView.register(HourlyCollectionViewCell.nib(), forCellWithReuseIdentifier: HourlyCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
    }
    
// MARK: - Setup location and fetch weather
    private func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    private func setupWeatherUI() {
        currentTempLabel.text = viewModel.currentTempString
        locationNameLabel.text = viewModel.locationNameString
        descriptionLabel.text = viewModel.descriptionWeatherString
        hightTempLabel.text = viewModel.hightTempString
        lowTempLabel.text = viewModel.lowTempString
    }
    
}

//MARK: - CLLocationManagerDelegate
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
                    self.activityIndicator.stopAnimating()
                    self.activityIndicator.isHidden = true
                    self.setupWeatherUI()
                    self.tableView.reloadData()
                    self.collectionView.reloadData()
                }
            }
        }
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DailyTableViewCell.identifier, for: indexPath) as! DailyTableViewCell
        let cellDailyViewModel = viewModel.cellDailyViewModel(at: indexPath)
        cell.configureDailyCell(viewModel: cellDailyViewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsDaily()
    }
}

//MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HourlyCollectionViewCell.identifier, for: indexPath) as! HourlyCollectionViewCell
        let cellHourlyViewModel = viewModel.cellHourlyViewModel(at: indexPath)
        cell.configureHourlyCell(viewModel: cellHourlyViewModel)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItemsHourly()
    }
}
