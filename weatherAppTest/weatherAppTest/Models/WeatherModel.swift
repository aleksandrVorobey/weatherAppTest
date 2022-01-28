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
    let temp: Double
    let weather: [Weather]
}

// MARK: - Weather
struct Weather: Codable {
    let weatherDescription: String
    let icon: String

    enum CodingKeys: String, CodingKey {
        case weatherDescription = "description"
        case icon
    }
}

// MARK: - Hourly
struct Hourly: Codable {
    let dt: Int
    let temp: Double
    let humidity: Int
    let weather: [Weather]
}

// MARK: - Daily
struct Daily: Codable {
    let dt: Int
    let temp: Temp
    let humidity: Int
    let weather: [Weather]
}

// MARK: - Temp
struct Temp: Codable {
    let min, max: Double
}
