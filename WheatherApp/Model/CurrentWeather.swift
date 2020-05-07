//
//  CurrentWeather.swift
//  WheatherApp
//
//  Created by Никита on 5/7/20.
//  Copyright © 2020 Никита. All rights reserved.
//

import Foundation


struct CurrentWeather {
    
    let cityName: String
    
    let temperature: Double
    var temperatureString: String {
        return "\(temperature.rounded())"
    }
    let feelsLikeTemperature: Double
    var feelsLikeTemperatureString: String {
        return "\(feelsLikeTemperature.rounded())"
    }
    
    let conditionCode: Int
    
    init?(currentWheatherData: CurrentWeatherData) {
        
        cityName = currentWheatherData.name
        temperature = currentWheatherData.main.temp
        feelsLikeTemperature = currentWheatherData.main.feelsLike
        conditionCode = currentWheatherData.weather.first!.id
    }
    
}
