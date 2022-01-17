//
//  NetworkManagerProtocol.swift
//  weatherAppTest
//
//  Created by Александр Воробей on 17.01.2022.
//

import Foundation

protocol NetworkManagerProtocol {
    func requestWeather(url: URL, completion: @escaping (Result<Codable, Error>) -> Void)
}
