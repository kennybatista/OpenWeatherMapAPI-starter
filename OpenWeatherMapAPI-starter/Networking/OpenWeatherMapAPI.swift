//
//  OpenWeatherMapAPI.swift
//  OpenWeatherMapAPI-starter
//
//  Created by Nikolas Burk on 28/09/16.
//  Copyright © 2016 Nikolas Burk. All rights reserved.
//

import Foundation
import SwiftyJSON


class OpenWeatherMapAPI {
  
    let baseURL : String = "http://api.openweathermap.org"
    let pathURL : String = "/data/2.5/weather"
    let appID : String = "2ce12b7816774b899dbbd867e66f6a5d"
    
    func createParameterURL(forCity: String, temperatureUnit: TemperatureUnit) -> String {
        var resultParameterURL : String = "?"
        resultParameterURL += "q=\(forCity)"
        if temperatureUnit == .fahrenheit {
            
        }
        resultParameterURL += "&appid=\(appID)"
        print(resultParameterURL)
        return resultParameterURL
    }
    
    func requestTodaysWeather(city: String, temperatureUnit: TemperatureUnit = .fahrenheit, completionHandler: (Weather) -> ()) {
        // ...
        let urlString: String = baseURL + pathURL + createParameterURL(forCity: city, temperatureUnit: temperatureUnit)
        let session: URLSession = URLSession.shared
        let url = URL(string: urlString)
        
        let task = session.dataTask(with: url!, completionHandler: { data, response, error -> Void in
            if let actualData = data {
                //        let dataString = String(data: actualData, encoding: String.Encoding.utf8)
                let json = try! JSONSerialization.jsonObject(with: actualData) as! [String: Any]
//                let json = JSON(data: actualData)
                
                
                
                
//                let lowTemp = json["temp_min"].string
//                print(lowTemp)
//
//                temp = "287.91";
//                "temp_max" = "289.82";
//                "temp_min" = "285.93";
//                "weather": <__NSSingleObjectArrayI 0x608000004b10>(
//                {
//                description = "light rain";

                
                //        let weatherObject = Weather.Weather()
                print("received json: \(json)")
            }
            else {
                print("no data received: \(error)")
            }
            
        })
        task.resume()
        
    }
    
    func requestWeatherForecast(for: String, days: Int, temperatureUnit: TemperatureUnit = .fahrenheit, completionHandler: ([Weather]) -> ()) {
        // ...
    }
    
    
    
  func requestCurrentWeather() {
    
    //We store the A/Users/kennybatista/Downloads/OpenWeatherMapAPI-starter/OpenWeatherMapAPI-starter/Info.plistPIs link inside of a variable
    let urlString: String = "http://api.openweathermap.org/data/2.5/weather?q=London&appid=76206cd3a7796e7db880c8385c0786ef"
    // We store the URLSession object inside of a variable, and use it's shared method, which is a GET request
    let session: URLSession = URLSession.shared
    //we store the APIs url inside of a shorter variable
    let url = URL(string: urlString)
    
    
    //the
    let task = session.dataTask(with: url!, completionHandler: { data, response, error -> Void in
      if let actualData = data {
        //        let dataString = String(data: actualData, encoding: String.Encoding.utf8)
        let json = try! JSONSerialization.jsonObject(with: actualData) as! [String: Any]
//        let weatherObject = Weather.Weather()
        print("received json: \(json)")
      }
      else {
        print("no data received: \(error)")
      }
      
    })
    task.resume()
    
  }
  
    
    
    
}



