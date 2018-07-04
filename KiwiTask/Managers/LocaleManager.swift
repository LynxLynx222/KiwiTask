//
//  LocaleManager.swift
//  KiwiTask
//
//  Created by Ondrej Andrysek on 7/4/18.
//  Copyright © 2018 cz.oa. All rights reserved.
//

import Foundation

class LocaleManager{
    static func getLocale() -> LocaleSettings{
        if Locale.current.identifier == "cs_CZ"{
            return LocaleSettings.czk
        }
        else{
            return LocaleSettings.eng
        }
    }
}
