//
//  SettingsViewModel.swift
//  GreatWeather
//
//  Created by Sean Murphy on 6/21/22.
//

import Foundation

enum Unit: String, CaseIterable {
    case celsius = "metric"
    case farenheit = "imperial"
}

extension Unit {
    
    var displayName: String {
        get {
            switch(self) {
            case .celsius:
                return "Celcius"
            case .farenheit:
                return "Fahrenheit"
            }
        }
    }
}

class SettingsViewModel {
    
    let units = Unit.allCases
    let userDefaults = UserDefaults.standard
    
    var selectedUnit: Unit {
        get {
            var unitValue = ""
            if let value = userDefaults.value(forKey: "unit") as? String {
                unitValue = value
            }
            return Unit(rawValue: unitValue) ?? Unit.farenheit
        } set {
            userDefaults.set(newValue.rawValue, forKey: "unit")
        }
    }
}
