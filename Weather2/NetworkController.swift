//
//  NetworkController.swift
//  Weather2
//
//  Created by Alexander Lovato on 9/9/16.
//  Copyright © 2016 Nonsense. All rights reserved.
//

import Foundation

class NetworkController {
    
    static let apiKey = "835c235f01bba7676b215f2d2bc52995"
    static let baseURL = "http://api.openweathermap.org/data/2.5/weather"
    
    
    //The really long method means it's taking the text entered from the user and replacing all spaces with underscores.
    static func searchByCityName(city: String) -> NSURL {
        let escaptedCityString = city.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet())
        
        return NSURL(string: baseURL + "?q=\(escaptedCityString)" + "&appid=\(apiKey)")!
    }
    
    
    static func dataAtURL(url: NSURL, completion: (data: NSData?) -> Void) {
        
        let session = NSURLSession.sharedSession()
        
        let dataTask = session.dataTaskWithURL(url) { (data, _, error) in
            if error != nil {
                print("Error in \(#function) - \(error!.localizedDescription)")
                completion(data: nil)
            } else {
                
                completion(data: data)
            }
        }
        
        dataTask.resume()
        
    }
    
}