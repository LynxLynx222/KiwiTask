//
//  Destination.swift
//  KiwiTask
//
//  Created by Ondrej Andrysek on 6/21/18.
//  Copyright © 2018 cz.oa. All rights reserved.
//

import Foundation

class Destination{
    var cityFrom: String
    var countryFromName: String
    var cityTo: String
    var countryToName: String
    var mapIdTo: String
    var flyDuration: String
    var distance : Double
    var price: Int
    var conversionFromEur: Double
    var dTime: Int
    var aTime: Int

    init?(json: [String: Any]){
        guard let cityFrom = json["cityFrom"] as? String,
            let countryFrom = json["countryFrom"] as? [String: Any],
            let countryFromName = countryFrom["name"] as? String,
            let cityTo = json["cityTo"] as? String,
            let countryTo = json["countryTo"] as? [String: Any],
            let countryToName = countryTo["name"] as? String,
            let mapIdTo = json["mapIdto"] as? String,
            let flyDuration = json["fly_duration"] as? String,
            let distance = json["distance"] as? Double,
            let price = json["price"] as? Int,
            let conversion = json["conversion"] as? [String: Any],
            let eur = conversion["EUR"] as? Double,
            let dTime = json["dTime"] as? Int,
            let aTime = json["aTime"] as? Int
            else{
                return nil
        }
        self.cityFrom = cityFrom
        self.countryFromName = countryFromName
        self.cityTo = cityTo
        self.countryToName = countryToName
        self.mapIdTo = mapIdTo
        self.flyDuration = flyDuration
        self.distance = distance
        self.price = price
        self.conversionFromEur = eur
        self.dTime = dTime
        self.aTime = aTime
    }
}
