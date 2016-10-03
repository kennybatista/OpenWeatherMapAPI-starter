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
    
    var forecastData : [Weather] = []
    
    
    @IBAction func goButton(_ sender: UIButton) {

        //    openWeatherMapAPI.requestCurrentWeather()
        
        openWeatherMapAPI.requestTodaysWeather(city: searchField.text!.trimmingCharacters(in: CharacterSet.whitespaces), completionHandler: { (weather: Weather) -> Void in
            
            DispatchQueue.main.async {
                self.minLabel.text = "Min: \(weather.minTemperature)°"
                self.maxLabel.text = "Max: \( weather.maxTemperature)°"
                self.descriptionLabel.text = "Descritption: \(weather.description)"
            }
            
            
        })
        //        openWeatherMapAPI.requestTodaysWeather(city: "Boston", completionHandler: whatShouldHappenToTheWeather)
    
    }
    
    @IBAction func foreCastButton(_ sender: UIButton) {
        openWeatherMapAPI.requestWeatherForecast(city: searchField.text!, days: Int(howManyDaysTextField.text!)!, completionHandler: { (weather: [Weather]) -> Void in
            DispatchQueue.main.async {
                self.forecastData = weather
                self.performSegue(withIdentifier: "segueToForecast", sender: nil)
            }

//            print(weather)
        })
       
    }
    
    
    
    
    let openWeatherMapAPI = OpenWeatherMapAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        
        if segue.identifier == "segueToForecast" {
            if let destinationConroller = segue.destination as? ForecastTableViewController{
              destinationConroller.forecastData = forecastData
            }
        }
    }
    
    
    func showErrorMessage(sender:UIViewController){
        //..... your UIAlertController here
        let alert = UIAlertController(title: "Error :(", message: "Could not find city, please try a different one!", preferredStyle: .alert)
        alert.show(self, sender: nil)
    }
    
}


//
//func whatShouldHappenToTheWeather(weather: Weather) -> Void {
//    print(weather)
//}
