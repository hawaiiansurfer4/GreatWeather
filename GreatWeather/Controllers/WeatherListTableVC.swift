//
//  WeatherListTableVC.swift
//  GreatWeather
//
//  Created by Sean Murphy on 6/20/22.
//

import Foundation
import UIKit

class WeatherListTableVC: UITableViewController, AddWeatherDelegate {
    
    private var weatherListVM = WeatherListViewModel()
    private var lastUnitSelected: Unit!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let userDefaults = UserDefaults.standard
        if let value = userDefaults.value(forKey: "unit") as? String {
            self.lastUnitSelected = Unit(rawValue: value)!
        }
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherCell
        
        let weatherVM = weatherListVM.modelAt(indexPath.row)
        cell.configure(weatherVM)
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherListVM.numberOfRows(section)
    }
    
    func addWeatherDidSave(vm: WeatherViewModel) {
        weatherListVM.addWeatherViewModel(vm)
        self.tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddWeatherCityVC" {
            prepareSegueForAddWeatherCityVC(segue: segue)
        } else if segue.identifier == "SettingsTableVC" {
            prepareSegueForSettingsTableVC(segue: segue)
        }
    }
    
    func prepareSegueForAddWeatherCityVC(segue: UIStoryboardSegue) {
        
        guard let nav = segue.destination as? UINavigationController else {
            fatalError("NavigationController not found")
        }
        
        guard let addWeatherCityVC = nav.viewControllers.first as? AddWeatherCityVC else {
            fatalError("AddWeatherCityVC not found")
        }
        
        addWeatherCityVC.delegate = self
    }
    
    func prepareSegueForSettingsTableVC(segue: UIStoryboardSegue) {
        guard let nav = segue.destination as? UINavigationController else {
            fatalError("NavigationController not found")
        }
        
        guard let settingsTableVC = nav.viewControllers.first as? SettingsTableVC else {
            fatalError("SettingsTableVC not found")
        }
        
        settingsTableVC.delegate = self
    }
}

extension WeatherListTableVC: SettingsDelegate {
    
    func settingsDone(vm: SettingsViewModel) {
        if lastUnitSelected.rawValue != vm.selectedUnit.rawValue {
            weatherListVM.updateUnit(to: vm.selectedUnit)
            tableView.reloadData()
            lastUnitSelected = Unit(rawValue: vm.selectedUnit.rawValue)
        }
    }
}
