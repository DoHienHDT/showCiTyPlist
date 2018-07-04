//
//  CitiData.swift
//  showCiTyPlist
//
//  Created by dohien on 7/4/18.
//  Copyright © 2018 hiền hihi. All rights reserved.
//

import Foundation
class CitiData {
    var cityCode : Int
    var name: String
    init?(dictionary: DICT) {
        guard let cityCode = dictionary["CityCode"] as? Int else { return nil }
        guard let name = dictionary["Name"]  as? String else { return nil }
        self.cityCode = cityCode
        self.name = name
    }
}
