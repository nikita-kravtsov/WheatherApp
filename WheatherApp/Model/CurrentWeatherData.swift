//
//  CurrentWeatherData.swift
//  WheatherApp
//
//  Created by Никита on 5/7/20.
//  Copyright © 2020 Никита. All rights reserved.
//

import Foundation

struct CurrentWeatherData: Codable {
    
    let name: String
    let main: Main
    let weather: [Weather]
    
    struct Weather: Codable {
        let id: Int
    }
    
    struct Main: Codable {
        let temp: Double
        let feelsLike: Double
        
        enum CodingKeys: String, CodingKey {
            case temp
            case feelsLike = "feels_like"
        }
    }
}
