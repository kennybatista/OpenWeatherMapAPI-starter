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
    let minTemperature: Double
    let maxTemperature: Double
    let avgTemperature: Double
    let temperatureUnit: TemperatureUnit
    let date : NSDate
}
/*
func tempConversion(unit : TemperatureUnit, kelvinValue : Double) -> Double{
    switch unit {
    case .kelvin:
        return kelvinValue
    case .fahrenheit:
        return (kelvinValue * 9.0 / 5.0) - 459.67
    case  .celsius:
        return kelvinValue - 273.15
    }
} */
