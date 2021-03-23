//
//  WeatherViewModel.swift
//  WeatherAppSwiftUI
//
//  Created by Jacob LeCoq on 3/22/21.
//

import Foundation

struct WeatherViewModel {
    // MARK: - PROPERTIES
    
    let id = UUID()
    let weather: Weather
    
    // MARK: - COMPUTED PROPERTIES
    
    var temperature: Double {
        return weather.temperature
    }
    
    var city: String {
        return weather.city
    }
    
    var sunrise: Date {
        return weather.sunrise
    }
    
    var sunset: Date {
        return weather.sunset
    }
    
    var icon: String {
        return weather.icon
    }
    
    // MARK: - FUNCS
    
    func getTemperatureByUnit(unit: TemperatureUnit) -> Double {
        switch unit {
        case .celsius:
            return weather.temperature - 273.15
        case .fahrenheit:
            return 1.8 * (weather.temperature - 273) + 32
        case .kelvin:
            return weather.temperature
        }
    }
}
