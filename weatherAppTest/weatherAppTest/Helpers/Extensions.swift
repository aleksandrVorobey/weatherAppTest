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
