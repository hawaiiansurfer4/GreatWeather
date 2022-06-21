//
//  Constants.swift
//  GreatWeather
//
//  Created by Sean Murphy on 6/20/22.
//

import Foundation

struct Constants {
    
    struct Urls {
        
        static func urlForWeatherByCity(city: String) -> URL {
            
            let userDefaults = UserDefaults.standard
            let unit = (userDefaults.value(forKey: "unit") as? String) ?? "imperial"
            
            return URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city.escaped())&appid=fbb73afd8acbeaa8c62739c255dd5330&units=\(unit)")!
        }
    }
}
