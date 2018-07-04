//
//  ApiService.swift
//  KiwiTask
//
//  Created by Ondrej Andrysek on 6/20/18.
//  Copyright © 2018 cz.oa. All rights reserved.
//

import Foundation
import UIKit

class ApiService{
    
    static let imageCache = NSCache<NSString, UIImage>()
    
    //MARK: Download data from url and return raw data
    static func request(url: String, method: Method, onResult: @escaping(Data?, Error?) -> ()){
        guard let url = URL(string: url) else {return}
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error{
                onResult(nil,error)
            }
            else{
                onResult(data, nil)
            }
        }.resume()
    }
    
    //MARK: Turn raw data into json
    static func requestJson(url: String, method: Method, onResult: @escaping(Any?, Error?) -> ()){
        request(url: url, method: method) { (data, error) in
            do {
                guard let data = data else {return}
                let resultObject = try JSONSerialization.jsonObject(with: data, options: [])
                DispatchQueue.main.async(execute: {
                    onResult(resultObject,nil)
                })
            } catch {
                DispatchQueue.main.async(execute: {
                    onResult(nil,nil)
                })
            }
            
        }
    }
    
    //MARK: Get destinations based on date, consider to add more parameters for customization
    static func getDestinations(latitude: Double, longitude: Double, dateFrom: String, dateTo: String, onResult: @escaping([Destination]?, Error?) -> ()){
        
        let locale = LocaleManager.getLocale().rawValue
        
        requestJson(url: "https://api.skypicker.com/flights?v=2&sort=popularity&asc=0&locale=\(locale)&daysInDestinationFrom=&daysInDestinationTo=&affilid=&children=0&infants=0&flyFrom=\(latitude)-\(longitude)-250km&to=anywhere&featureName=aggregateResults&dateFrom=\(dateFrom)&dateTo=\(dateTo)&typeFlight=oneway&returnFrom=&returnTo=&one_per_date=0&oneforcity=1&wait_for_refresh=0&adults=1&limit=5", method: .get) { (response,error) in
            if let response = response as? [String: Any], let json = response["data"] as? [[String: Any]]{
                var destinations = [Destination]()
                for i in json{
                    if let destination = Destination(json: i){
                        destinations.append(destination)
                    }
                }
                onResult(destinations, nil)
            }
            else{
                onResult(nil, error)
            }
            
        }
    }
    
    //MARK: Check if the image is already cached, if not download it
    static func downloadImage(url: String, onResult: @escaping(_ image: UIImage?, _ error: Error?) -> ()){
        print("url \(url)")
        if let cachedImage = imageCache.object(forKey: url as NSString){
            print("cached")
            onResult(cachedImage, nil)
        }
        else{
            request(url: url, method: .get) { (data, error) in
                if let error = error{
                    print("image error")
                    onResult(nil, error)
                }
                else{
                    if let data = data, let image = UIImage(data: data){
                        print("image downloaded")
                        imageCache.setObject(image, forKey: url as NSString)
                        onResult(image, nil)
                    }
                    else{
                        print("error")
                        onResult(UIImage(named: "no_preview"), nil)
                    }
                }
            }
        }
    }
}
