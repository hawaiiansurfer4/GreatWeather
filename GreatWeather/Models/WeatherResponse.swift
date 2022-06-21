//
//  WeatherResponse.swift
//  GreatWeather
//
//  Created by Sean Murphy on 6/20/22.
//

import Foundation

struct WeatherResponse: Codable {
    let name: String
    let main: Weather
}

struct Weather: Codable {
    let temp: Double
    let humidity: Double
}


