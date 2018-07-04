//
//  DataService.swift
//  showCiTyPlist
//
//  Created by dohien on 7/4/18.
//  Copyright © 2018 hiền hihi. All rights reserved.
//

import Foundation
typealias DICT = Dictionary<AnyHashable, Any>
class DataService {
    static let shared: DataService = DataService()
    private var _dataCiti: [CitiData]?
    var dataCiti : [CitiData] {
        get {
            if _dataCiti == nil {
                getDataCiti()
            }
            return _dataCiti ?? []
        }
        set {
            _dataCiti = newValue
        }
    }
    func getDataCiti() {
        _dataCiti = []
        guard let plistPath = Bundle.main.path(forResource: "Cities", ofType: "plist") else { return  }
        guard let plistData = FileManager.default.contents(atPath: plistPath) else { return }
        do {
            guard let plisDict = try PropertyListSerialization.propertyList(from: plistData, options: .mutableContainersAndLeaves, format: nil) as? DICT else { return  }
            guard let dictionary = plisDict["Cities"] as? [DICT] else { return  }
            for cityDictionary in dictionary {
                if let city = CitiData(dictionary: cityDictionary){
                    print(city.name, city.cityCode)
                    _dataCiti?.append(city)
                }
            }
        } catch  {
            print("Error")
        }
    }

    private var _dictrics: [DistrictData]?
    var dataDistric : [DistrictData] {
        get {
            if _dictrics == nil {
                getDataDistric()
            }
            return _dictrics ?? []
        }
        set {
            _dictrics = newValue
        }
    }
    func getDataDistric(){
        _dictrics = []
        guard let plistPath = Bundle.main.path(forResource: "Districts", ofType: "plist") else { return  }
        guard let plistData = FileManager.default.contents(atPath: plistPath) else { return  }
        do {
            guard let plistDict = try PropertyListSerialization.propertyList(from: plistData, options: .mutableContainersAndLeaves, format: nil) as? DICT else { return  }
            guard let dictionary = plistDict["Districts"] as? [DICT] else { return  }
            for dictrictDictionary in dictionary {
                if let dicts = DistrictData(dictionary: dictrictDictionary){
//                    print(dicts.name, dicts.cityCode, dicts.districts)
                    _dictrics?.append(dicts)
                }
                
            }
        } catch  {
            print("Error")
        }
    }
    
    func getplist(citiData : Int ) -> [DistrictData] {
        
        getDataDistric()
        
        var datafilited : [DistrictData] = []
        
        // xét từng phần tử trong mảng _dictricts
        for score in _dictrics ?? []{
            
            if score.cityCode == citiData {
                datafilited.append(score)
            }
        }
        return datafilited
    }
}
