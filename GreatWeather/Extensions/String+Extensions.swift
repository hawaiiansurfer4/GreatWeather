//
//  String+Extensions.swift
//  GreatWeather
//
//  Created by Sean Murphy on 6/20/22.
//

import Foundation

extension String {
    
    func escaped() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
}
