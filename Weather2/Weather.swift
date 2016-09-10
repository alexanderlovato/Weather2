//
//  Weather.swift
//  Weather2
//
//  Created by Alexander Lovato on 9/8/16.
//  Copyright © 2016 Nonsense. All rights reserved.
//

import Foundation
import UIKit

class Weather {
    
    static let kWeatherKey = "weather"
    static let kMainKey = "main"
    static let kDescriptionKey = "description"
    static let kIconKey = "icon"
    static let kNameKey = "name"
    static let kTemperatureKey = "temp"
    static let kWindKey = "wind"
    static let kWindSpeedKey = "speed"
    static let kHumidityKey = "humidity"
    
    var main = ""
    var description = ""
    var iconString = ""
    var iconImage: UIImage?
    var cityName = ""
    var temperatureK: Float?
    var temperatureC: Float? {
        guard let temperature = temperatureK else { return nil }
        return temperature - 275.15
    }
    var windSpeed: Float?
    var humidity: Float?
    
//    init(main: String = "Clouds", description: String = "few clouds", iconString: String = "02n", iconImage: UIImage, cityName: String = "Salt Lake City", state: String, temperatureK: Float?, windSpeed: Int, humidity: String) {
//        
//        self.main = main
//        self.description = description
//        self.iconString = iconString
//        self.iconImage = iconImage
//        self.cityName = cityName
//        self.state = state
//        self.temperatureK = temperatureK
//        self.windSpeed = windSpeed
//        self.humidity = humidity
//    }
    
    init(jsonDictionary: [String : AnyObject]) {
        
        if let arrayUsingWeatherKey = jsonDictionary[Weather.kWeatherKey] as? [[String : AnyObject]] {
            
            if let main = arrayUsingWeatherKey[0][Weather.kMainKey] as? String {
                self.main = main
            }
            if let description = arrayUsingWeatherKey[0][Weather.kDescriptionKey] as? String {
                self.description = description
            }
            if let iconString = arrayUsingWeatherKey[0][Weather.kIconKey] as? String {
                self.iconString = iconString
            }
        }
        
        if let main = jsonDictionary[Weather.kMainKey] as? [String : AnyObject] {
            
            if let temperature = main[Weather.kTemperatureKey] as? NSNumber {
                self.temperatureK = Float(temperature)
            }
            
            if let humidity = main[Weather.kHumidityKey] as? NSNumber {
                self.humidity = Float(humidity)
            }
        }
        
        if let cityName = jsonDictionary[Weather.kNameKey] as? String {
            self.cityName = cityName
        }
    }
    
    
}















