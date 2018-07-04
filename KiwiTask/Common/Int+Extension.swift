//
//  Int64+Extension.swift
//  KiwiTask
//
//  Created by Ondrej Andrysek on 6/27/18.
//  Copyright © 2018 cz.oa. All rights reserved.
//

import Foundation

extension Int{
    func asTimeInString() -> String{
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_CN")
        dateFormatter.dateFormat = "HH:mm"
        let timeString = dateFormatter.string(from: date)
        return timeString
    }
    func asDateInString() -> String{
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
}
