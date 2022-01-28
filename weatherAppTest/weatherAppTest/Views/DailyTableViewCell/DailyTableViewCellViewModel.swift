//
//  DailyTableViewCellViewModel.swift
//  weatherAppTest
//
//  Created by Александр Воробей on 21.01.2022.
//

import Foundation

class DailyTableViewCellViewModel {
    var dailyWeatherModel: Daily?
    
    var hightTempString: String {
        return String(format: "%.f", dailyWeatherModel?.temp.max ?? 0.0)
    }
    
    var lowTempString: String {
        return String(format: "%.f", dailyWeatherModel?.temp.min ?? 0.0)
    }
    
    var humidityString: String {
        return String(dailyWeatherModel?.humidity ?? 0) + " %"
    }
    
    var dayString: String {
        return String(Date(timeIntervalSince1970: TimeInterval(dailyWeatherModel?.dt ?? 0)).getDayForDate())
    }
    
    var iconString: String {
        return dailyWeatherModel?.weather.first?.icon.getWeatherIcon() ?? "questionmark.circle.fill"
    }
    
    init(dailyWeatherModel: Daily) {
        self.dailyWeatherModel = dailyWeatherModel
    }
}
