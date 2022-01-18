//
//  URLFactory.swift
//  weatherAppTest
//
//  Created by Александр Воробей on 17.01.2022.
//

import Foundation

struct URLFactory {
    
    static let apiKey = "51d25b36e3bf3abc81d22abeacab778a"

    static func url(lat: Double, lon: Double) -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.openweathermap.org"
        components.path = "/data/2.5/onecall"
        components.queryItems = [URLQueryItem(name: "lat", value: "\(lat)"),
                                 URLQueryItem(name: "lon", value: "\(lon)"),
                                 URLQueryItem(name: "units", value: "standard"),
                                 URLQueryItem(name: "exclude", value: "minutely"),
                                 //URLQueryItem(name: "lang", value: "en"),
                                 URLQueryItem(name: "appid", value: "\(apiKey)")]
        return components.url!
    }
}
