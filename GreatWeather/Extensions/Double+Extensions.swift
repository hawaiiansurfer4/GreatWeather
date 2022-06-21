//
//  Double+Extensions.swift
//  GreatWeather
//
//  Created by Sean Murphy on 6/21/22.
//

import Foundation

extension Double {
    
    func formatAsDegree() -> String {
        return String(format: "%.0f°",self)
    }
}
