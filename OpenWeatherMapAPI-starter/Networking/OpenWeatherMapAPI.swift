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
    let forcastPathURL : String = "/data/2.5/forecast/daily"
    let appID : String = "2ce12b7816774b899dbbd867e66f6a5d"
    
    func createParameterURL(forCity: String, temperatureUnit: TemperatureUnit, days: Int = -1) -> String {
        var resultParameterURL : String = "?"
        var tempCity = forCity.replacingOccurrences(of: " ", with: "+")
        
        resultParameterURL += "q=\(tempCity)"
        
        if temperatureUnit == .celsius {
            resultParameterURL += "&units=metric"
        }
        else if temperatureUnit == .fahrenheit {
            resultParameterURL += "&units=imperial"
        }
        else{
            //Do nothing becasue OpenWeatherAPI by default is in kevlin!
        }
        
        if(days != -1){
            resultParameterURL += "&cnt=\(days)"
        }
        
        resultParameterURL += "&appid=\(appID)"
        print(resultParameterURL)
        return resultParameterURL
    }
    
    func requestTodaysWeather(city: String, temperatureUnit: TemperatureUnit = .fahrenheit, completionHandler: @escaping (Weather) -> ()) {
        // ...
        let urlString: String = baseURL + pathURL + createParameterURL(forCity: city, temperatureUnit: temperatureUnit)
        let session: URLSession = URLSession.shared
        let url = URL(string: urlString)
        
        let task = session.dataTask(with: url!, completionHandler: { data, response, error -> Void in
            if let actualData = data {
                //        let dataString = String(data: actualData, encoding: String.Encoding.utf8)
                //                let json = try! JSONSerialization.jsonObject(with: actualData) as! [String: Any]
                let json = JSON(data: actualData)
                let maxTemp = json["main"]["temp_max"].doubleValue
                let minTemp = json["main"]["temp_min"].doubleValue
                let avgTemp = json["main"]["temp"].doubleValue
                let description = json["weather"][0]["description"].stringValue
                let date : NSDate = NSDate(timeIntervalSince1970: TimeInterval(json["dt"].intValue))
                
                
                
                
                
                //                let lowTemp = json["temp_min"].string
                //                print(lowTemp)x
                //
                //                temp = "287.91";
                //                "temp_max" = "289.82";
                //                "temp_min" = "285.93";
                //                "weather": <__NSSingleObjectArrayI 0x608000004b10>(
                //                {
                //                description = "light rain";
                
                
                //        let weatherObject = Weather.Weather()
                let weatherObj = Weather(description: description, minTemperature: minTemp, maxTemperature: maxTemp, avgTemperature: avgTemp, temperatureUnit: temperatureUnit, date: date)
                
                completionHandler(weatherObj)
                
                print("received json: \(json)")
            }
            else {
                print("no data received: \(error)")
            }
            
        })
        task.resume()
        
    }
    
    func requestWeatherForecast(city: String, days: Int, temperatureUnit: TemperatureUnit = .fahrenheit, completionHandler: @escaping ([Weather]) -> ()) {
        let urlString = baseURL + forcastPathURL + createParameterURL(forCity: city, temperatureUnit: temperatureUnit, days: days)
        let session : URLSession = URLSession.shared
        let url = URL(string: urlString)
        
        let task = session.dataTask(with: url!, completionHandler: { data, response, error -> Void in
            if let actualData = data {
                //        let dataString = String(data: actualData, encoding: String.Encoding.utf8)
                //                let json = try! JSONSerialization.jsonObject(with: actualData) as! [String: Any]
                
                
                let json = JSON(data: actualData)
                let jsonList = json["list"]
                var weatherArray : [Weather] = []

                for i in 0..<days{
                    let maxTemp = jsonList[i]["temp"]["max"].doubleValue
                    let minTemp = jsonList[i]["temp"]["min"].doubleValue
                    let avgTemp = jsonList[i]["deg"].doubleValue
                    let description = jsonList[i]["weather"][0]["description"].stringValue
                    let date : NSDate = NSDate(timeIntervalSince1970: TimeInterval(jsonList[i]["dt"].intValue))
                    let weatherObj = Weather(description: description, minTemperature: minTemp, maxTemperature: maxTemp, avgTemperature: avgTemp, temperatureUnit: temperatureUnit, date: date)
                    weatherArray.append(weatherObj)
                }
                
                
                

                
                
                
                completionHandler(weatherArray)
                
                print("received json: \(json)")
            }
            else {
                print("no data received: \(error)")
            }
            
        })
        task.resume()
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


