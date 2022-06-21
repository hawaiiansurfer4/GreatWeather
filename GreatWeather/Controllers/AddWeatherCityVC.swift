//
//  AddWeatherCityVC.swift
//  GreatWeather
//
//  Created by Sean Murphy on 6/20/22.
//

import UIKit

protocol AddWeatherDelegate {
    func addWeatherDidSave(vm: WeatherViewModel)
}

class AddWeatherCityVC: UIViewController {
    
    private var addWeatherVM = AddWeatherViewModel()
    var delegate: AddWeatherDelegate?
    
    @IBOutlet weak var cityNameTextField: UITextField!
    
    @IBAction func saveCityButtonPresses() {
        
        if let city = cityNameTextField.text {
            addWeatherVM.addWeather(for: city) { (vm) in
                self.delegate?.addWeatherDidSave(vm: vm)
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func closeButtonPressed() {
        self.dismiss(animated: true, completion: nil)
    }
}
