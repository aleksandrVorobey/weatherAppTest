//
//  Extensions.swift
//  weatherAppTest
//
//  Created by Александр Воробей on 23.01.2022.
//

import Foundation

extension Date {
    func getTimeForDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: self)
    }
    
    func getHourForDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH"
        return formatter.string(from: self)
    }
    
    func getDayForDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter.string(from: self)
    }
    
}

extension String {
    func deletingPrefix() -> String {
        let newString = self.components(separatedBy: "/")
        return newString[1]
    }
    
    func getWeatherIcon() -> String {
        switch self {
        case "01d":
            return "sun.max.fill"
        case "01n":
            return "moon.fill"
        case "02d":
            return "cloud.sun.fill"
        case "02n":
            return "cloud.moon.fill"
        case "03d":
            return "cloud.fill"
        case "03n":
            return "cloud.fill"
        case "04d":
            return "cloud.fill"
        case "04n":
            return "cloud.fill"
        case "09d":
            return "cloud.drizzle.fill"
        case "09n":
            return "cloud.drizzle.fill"
        case "10d":
            return "cloud.heavyrain.fill"
        case "10n":
            return "cloud.heavyrain.fill"
        case "11d":
            return "cloud.bolt.fill"
        case "11n":
            return "cloud.bolt.fill"
        case "13d":
            return "cloud.snow.fill"
        case "13n":
            return "cloud.snow.fill"
        case "50d":
            return "cloud.fog.fill"
        case "50n":
            return "cloud.fog.fill"
        default:
            return "thermometer"
        }
    }
    
}
