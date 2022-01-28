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
        return String(Date(timeIntervalSince1970: TimeInterval(hourlyWeatherModel?.dt ?? 0)).getHourForDate())
    }
    
    var humidityString: String {
        return String(hourlyWeatherModel?.humidity ?? 0) + "%"
    }
    
    var tempString: String {
        return String(format: "%.f", hourlyWeatherModel?.temp ?? 0.0)
    }
    
    var iconString: String {
        return hourlyWeatherModel?.weather.first?.icon.getWeatherIcon() ?? "questionmark.circle.fill"
    }
    
    init(hourlyWeatherModel: Hourly) {
        self.hourlyWeatherModel = hourlyWeatherModel
    }
}
