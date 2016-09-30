//
//  ViewController.swift
//  OpenWeatherMapAPI-starter
//
//  Created by Nikolas Burk on 28/09/16.
//  Copyright © 2016 Nikolas Burk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var howManyDaysTextField: UITextField!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var minLabel: UILabel!
    @IBOutlet weak var maxLabel: UILabel!
    
    
    
    
    @IBAction func goButton(_ sender: UIButton) {
    }
    
    @IBAction func foreCastButton(_ sender: UIButton) {
    }
    
    
    
    
    let openWeatherMapAPI = OpenWeatherMapAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //    openWeatherMapAPI.requestCurrentWeather()
        print("Start of our testing")
        openWeatherMapAPI.requestTodaysWeather(city: "Boston", completionHandler: { (weather: Weather) -> Void in
            print("It's working")
        
        })
//        openWeatherMapAPI.requestTodaysWeather(city: "Boston", completionHandler: whatShouldHappenToTheWeather)
    }
    
}

//
//func whatShouldHappenToTheWeather(weather: Weather) -> Void {
//    print(weather)
//}
