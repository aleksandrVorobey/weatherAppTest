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
    
    var currentTempString: String {
        return String(weatherModel?.current.temp ?? 0.0)
    }
    
    var locationNameString: String {
        return String(weatherModel?.timezone ?? "__")
    }
    
    var hightTempString: String {
        return String(format: "%.f", dailyWeather?.temp.max ?? 0.0)
    }
    
    var lowTempString: String {
        return String(format: "%.f", dailyWeather?.temp.min ?? 0.0)
    }
    
    var descriptionString: String {
        return String(currentWeather?.weatherDescription ?? "__")
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
                    completion()
                }
            case .failure(let error):
                print("Error: - \(error.localizedDescription)")
            }
        }
    }
}
