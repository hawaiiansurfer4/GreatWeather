//
//  WeatherListTableVC.swift
//  GreatWeather
//
//  Created by Sean Murphy on 6/20/22.
//

import Foundation
import UIKit

class WeatherListTableVC: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        UINavigationBar.appearance().barTintColor = UIColor.blue
    }
}
