//
//  HourlyCollectionCellViewModel.swift
//  weatherAppTest
//
//  Created by Александр Воробей on 27.01.2022.
//

import Foundation

class HourlyCollectionCellViewModel {
    var hourlyWeatherModel: Hourly?
    
    var timeString: String {
        return String(hourlyWeatherModel?.dt ?? 0)
    }
    
    var humidityString: String {
        return String(hourlyWeatherModel?.humidity ?? 0)
    }
    
    var tempString: String {
        return String(hourlyWeatherModel?.temp ?? 0)
    }
    
    init(hourlyWeatherModel: Hourly) {
        self.hourlyWeatherModel = hourlyWeatherModel
    }
}
