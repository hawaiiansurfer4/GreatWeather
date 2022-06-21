//
//  WeatherCell.swift
//  GreatWeather
//
//  Created by Sean Murphy on 6/20/22.
//

import UIKit

class WeatherCell: UITableViewCell {
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    
    func configure(_ vm: WeatherViewModel) {
        self.cityLabel.text = vm.city
        self.tempLabel.text = vm.temperature.formatAsDegree()
    }
}
