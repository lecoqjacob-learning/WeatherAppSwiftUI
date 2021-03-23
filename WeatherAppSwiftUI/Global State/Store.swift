//
//  Store.swift
//  WeatherAppSwiftUI
//
//  Created by Jacob LeCoq on 3/22/21.
//

import Foundation

class Store: ObservableObject {
    
    @Published var weatherList: [WeatherViewModel] = [WeatherViewModel]()
    @Published var selectedUnit: TemperatureUnit = .kelvin
    
    init(){
        selectedUnit = UserDefaults.standard.unit
    }
    
    func addWeather(_ weather: WeatherViewModel){
        self.weatherList.append(weather)
    }
}
