//
//  Date+Extension.swift
//  KiwiTask
//
//  Created by Ondrej Andrysek on 6/24/18.
//  Copyright © 2018 cz.oa. All rights reserved.
//

import Foundation

class DateManager{
    static func getNextWeekDay(days: Int) -> String?{
        let currentDate = Date()
        var dateComponent = DateComponents()
        dateComponent.day = days
        let futureDate = Calendar.current.date(byAdding: dateComponent, to: currentDate)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        if let fuDate = futureDate{
            let dateString = dateFormatter.string(from: fuDate)
            return dateString
        }
        return nil
    }
}
