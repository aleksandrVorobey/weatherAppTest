//
//  WeatherResponse.swift
//  weatherAppTest
//
//  Created by Александр Воробей on 18.01.2022.
//

import Foundation

// MARK: - WeatherModel
struct WeatherModel: Codable {
    let timezone: String
    let current: Current
    let hourly: [Hourly]
    let daily: [Daily]
}

// MARK: - Current
struct Current: Codable {
    let dt: Int
    let temp: Double
    let feelsLike: Double
    let pressure: Int
    let humidity: Int
    let dewPoint: Double
    let clouds: Int
    let windSpeed: Double
    let windDeg: Int
    let weather: [Weather]

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
}

// MARK: - Weather
struct Weather: Codable {
    //let main: Main
    let weatherDescription: String
    let icon: String

    enum CodingKeys: String, CodingKey {
        //case main
        case weatherDescription = "description"
        case icon
    }
}

//enum Main: String, Codable {
//    case clouds = "Clouds"
//    case snow = "Snow"
//    case empty = ""
//}

//enum Description: String, Codable {
//    case небольшойСнег = "небольшой снег"
//    case облачноСПрояснениями = "облачно с прояснениями"
//    case пасмурно = "пасмурно"
//    case снег = "снег"
//    case empty = ""
//}

// MARK: - Hourly
struct Hourly: Codable {
    let dt: Int
    let temp: Double
    let humidity: Int
    let weather: [Weather]
    let pop: Double
    
}

// MARK: - Daily
struct Daily: Codable {
    
    let dt: Int
    let temp: Temp
    let humidity: Int
    let weather: [Weather]
    let pop: Double
    
}

// MARK: - Temp
struct Temp: Codable {
    let min, max: Double
}
