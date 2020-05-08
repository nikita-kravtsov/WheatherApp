//
//  NetworkWeatherManager.swift
//  WheatherApp
//
//  Created by Никита on 5/7/20.
//  Copyright © 2020 Никита. All rights reserved.
//

import Foundation
import CoreLocation

struct NetworkWeatherManager {
    
    enum RequestType {
        case cityName(city: String)
        case coordinate(latitude: CLLocationDegrees, longitude: CLLocationDegrees)
    }
    
    var onCompletion: ((CurrentWeather) -> Void)?
    
    func fetchCurrentWeather(forRequestType requestType: RequestType) {
        var urlString = ""
        switch requestType {
        case .cityName(let city):
            urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&apikey=\(apiKey)&units=metric"
            
        case .coordinate(let latitude, let longitude):
            urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&apikey=\(apiKey)&units=metric"
        }
        perfomeRequest(withURLString: urlString)
    }
    
    fileprivate func perfomeRequest(withURLString urlString: String) {
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
    
    fileprivate func parseJSON(with data: Data) -> CurrentWeather? {
        
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
