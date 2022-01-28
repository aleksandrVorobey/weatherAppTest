//
//  ViewModel.swift
//  weatherAppTest
//
//  Created by Александр Воробей on 19.01.2022.
//

import Foundation

final class ViewModel: NSObject {
    
    private var weatherModel: WeatherModel?
    private var currentWeather: Weather?
    private var dailyWeather: Daily?
    private var dailyWeatherArray = [Daily]()
    private var hourlyWeatherArray = [Hourly]()
    
    private let backupData = FileManager.default.urls(for: .documentDirectory,
                                                         in: .userDomainMask)[0].appendingPathComponent("WeatherData.plist")
    
    //MARK: - Property for main model
    var currentTempString: String {
        return String(format: "%.f", weatherModel?.current.temp ?? 0.0) + "°"
    }
    
    var locationNameString: String {
        return weatherModel?.timezone.deletingPrefix() ?? "Unknow"
    }
    
    var hightTempString: String {
        return "H: " + String(format: "%.f", dailyWeather?.temp.max ?? 0.0) + "°"
    }
    
    var lowTempString: String {
        return "L: " + String(format: "%.f", dailyWeather?.temp.min ?? 0.0) + "°"
    }
    
    var descriptionWeatherString: String {
        return currentWeather?.weatherDescription ?? "Unknow"
    }
    
    //MARK: - Configure hourly weather
    func numberOfItemsHourly() -> Int {
        return hourlyWeatherArray.count
    }
    
    func cellHourlyViewModel(at indexPath: IndexPath) -> HourlyCollectionCellViewModel {
        let hourlyWeatherModel = hourlyWeatherArray[indexPath.item]
        return HourlyCollectionCellViewModel(hourlyWeatherModel: hourlyWeatherModel)
    }
    
    //MARK: - Configure daily weather
    func numberOfRowsDaily() -> Int {
        return dailyWeatherArray.count
    }
    
    func cellDailyViewModel(at indexPath: IndexPath) -> DailyTableViewCellViewModel {
        let dailyWeatherModel = dailyWeatherArray[indexPath.row]
        return DailyTableViewCellViewModel(dailyWeatherModel: dailyWeatherModel)
    }
    
    //MARK: - Backup
    private func saveBackup(data: WeatherModel) {
        do {
            let data = try PropertyListEncoder().encode(data)
            try data.write(to: backupData)
            print("Save")
        }
        catch let error {
            print(error)
        }
    }
    
    private func loadBackup(){
        guard let data = try? Data(contentsOf: backupData) else {
            return
        }
        do {
            let backup = try PropertyListDecoder().decode(WeatherModel.self, from: data)
            weatherModel = backup
            currentWeather = backup.current.weather.first
            dailyWeather = backup.daily.first
            dailyWeatherArray = backup.daily
            hourlyWeatherArray = backup.hourly
            print("Load")
        } catch let error {
            print(error)
        }
    }
    
    //MARK: - Get weather
    func getWeather(lat: Double, lon: Double, completion: @escaping () -> Void) {
        NetworkManager<WeatherModel>.baseRequest(for: URLFactory.url(lat: lat, lon: lon)) { result in
            switch result {
            case .success(let weather):
                DispatchQueue.main.async {
                    self.weatherModel = weather
                    self.currentWeather = weather.current.weather.first
                    self.dailyWeather = weather.daily.first
                    self.dailyWeatherArray = weather.daily
                    self.hourlyWeatherArray = weather.hourly
                    self.saveBackup(data: weather)
                    completion()
                }
            case .failure(let error):
                print("Error: - \(error.localizedDescription)")
                self.loadBackup()
                completion()
            }
        }
    }
}
