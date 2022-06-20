//
//  AddWeatherCityVC.swift
//  GreatWeather
//
//  Created by Sean Murphy on 6/20/22.
//

import UIKit

class AddWeatherCityVC: UIViewController {
    
    @IBOutlet weak var cityNameTextField: UITextField!
    
    @IBAction func saveCityButtonPresses() {
        
    }
    
    @IBAction func closeButtonPressed() {
        self.dismiss(animated: true, completion: nil)
    }
}
