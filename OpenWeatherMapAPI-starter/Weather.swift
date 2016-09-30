//
//  Weather.swift
//  OpenWeatherMapAPI-starter
//
//  Created by Kenny Batista on 9/30/16.
//  Copyright © 2016 Nikolas Burk. All rights reserved.
//

import Foundation


enum TemperatureUnit {
    case kelvin
    case fahrenheit
    case celsius
}

struct Weather {
    let description: String
    let minTemperature: Float
    let maxTemperature: Float
    let avgTemperature: Float
    let temperatureUnit: TemperatureUnit
}
