//
//  Double+Extension.swift
//  KiwiTask
//
//  Created by Ondrej Andrysek on 7/3/18.
//  Copyright © 2018 cz.oa. All rights reserved.
//

import Foundation

extension Double {
    func roundTo(places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
