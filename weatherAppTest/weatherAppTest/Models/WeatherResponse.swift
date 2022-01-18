//
//  WeatherResponse.swift
//  weatherAppTest
//
//  Created by Александр Воробей on 18.01.2022.
//

import Foundation

// MARK: - WeatherResponse
struct WeatherResponse: Codable {
    let current: Weather
    let hourly: [Weather]
    let daily: [Daily]

    static func empty() -> WeatherResponse {
        return WeatherResponse(current: Weather(), hourly: [Weather](repeating: Weather(), count: 23), daily: [Daily](repeating: Daily(), count: 8))
    }
}

// MARK: - Current
struct Weather: Codable, Identifiable {
    let dt: Int
    let temp: Double
    let feelsLike: Double
    let pressure: Int
    let humidity: Int
    let dewPoint: Double
    let clouds: Int
    let windSpeed: Double
    let windDeg: Int
    let weather: [WeatherDetail]

    enum CodingKeys: String, CodingKey {
        case dt, temp
        case feelsLike = "feels_like"
        case pressure, humidity
        case dewPoint = "dew_point"
        case clouds
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case weather
    }
    
    init() {
        dt = 0
        temp = 0.0
        feelsLike = 0.0
        pressure = 0
        humidity = 0
        dewPoint = 0.0
        clouds = 0
        windSpeed = 0.0
        windDeg = 0
        weather = []
    }
}

extension Weather {
    var id: UUID {
        return UUID()
    }
}

// MARK: - WeatherDetail
struct WeatherDetail: Codable {
    let main: Main
    let weatherDescription: Description
    let icon: Icon

    enum CodingKeys: String, CodingKey {
        case main
        case weatherDescription = "description"
        case icon
    }
}

enum Icon: String, Codable {
    case the04D = "04d"
    case the04N = "04n"
    case the13D = "13d"
    case the13N = "13n"
    case empty = ""
}

enum Main: String, Codable {
    case clouds = "Clouds"
    case snow = "Snow"
    case empty = ""
}

enum Description: String, Codable {
    case небольшойСнег = "небольшой снег"
    case облачноСПрояснениями = "облачно с прояснениями"
    case пасмурно = "пасмурно"
    case снег = "снег"
    case empty = ""
}

// MARK: - Daily
struct Daily: Codable, Identifiable {
    let dt : Int
    let temp: Temp
    let weather: [WeatherDetail]
    
    init() {
        dt = 0
        temp = Temp(min: 0.0, max: 0.0)
        weather = [WeatherDetail(main: .empty, weatherDescription: .empty, icon: .empty)]
    }
}

extension Daily {
    var id: UUID {
        return UUID()
    }
}

// MARK: - Temp
struct Temp: Codable {
    let min, max: Double
}
