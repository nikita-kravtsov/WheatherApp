//
//  NetworkWeatherManager.swift
//  WheatherApp
//
//  Created by Никита on 5/7/20.
//  Copyright © 2020 Никита. All rights reserved.
//

import Foundation

struct NetworkWeatherManager {
    
    var onCompletion: ((CurrentWeather) -> Void)?
    
    func fetchCurrentWeather(forCity city: String) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&apikey=\(apiKey)&units=metric"
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
                if let currentWheather = self.parseJSON(with: data) {
                    self.onCompletion?(currentWheather)
                }
            }
        }
        task.resume()
    }
    
    func parseJSON(with data: Data) -> CurrentWeather? {
        
        let decoder = JSONDecoder()
        do {
           let currentWheatherData = try decoder.decode(CurrentWeatherData.self, from: data)
            guard let currentWheather = CurrentWeather(currentWheatherData: currentWheatherData) else {
                return nil }
            return currentWheather
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
}
