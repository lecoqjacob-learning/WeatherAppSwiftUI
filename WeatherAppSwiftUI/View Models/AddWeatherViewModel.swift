//
//  AddWeatherViewModel.swift
//  WeatherAppSwiftUI
//
//  Created by Jacob LeCoq on 3/22/21.
//

import Foundation

class AddWeatherViewModel: ObservableObject {
    @Published var city: String = ""
    
    func save(completion: @escaping (WeatherViewModel?, NetworkError?) -> Void) {
        Webservice().getWeatherByCity(city: city) { result in
            switch result {
            case .success(let weather):
                DispatchQueue.main.async {
                    completion(WeatherViewModel(weather: weather), nil)
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    completion(nil, error)
                }
            }
        }
    }
}
