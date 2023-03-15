//
//  LocalPreferences.swift
//  TestRecruitment
//
//  Created by Kelvin on 15/03/23.
//

import Foundation

enum KeyDefaults: String {
    case userName = "Username"
    case name = "Name"
}

public struct Pref {
    
    static func saveString(_ key: KeyDefaults, value: String) {
        UserDefaults.standard.set(value, forKey: key.rawValue)
    }
    
    static func getString(_ key: KeyDefaults) -> String {
        return UserDefaults.standard.string(forKey: key.rawValue) ?? ""
    }
    
    static func saveBool(_ key: KeyDefaults, value: Bool) {
        UserDefaults.standard.set(value, forKey: key.rawValue)
    }
    
    static func getBool(_ key: KeyDefaults) -> Bool {
        return UserDefaults.standard.bool(forKey: key.rawValue)
    }
    
    static func saveInt(_ key: KeyDefaults, value: Int) {
        UserDefaults.standard.set(value, forKey: key.rawValue)
    }
    
    static func getInt(_ key: KeyDefaults) -> Int {
        return UserDefaults.standard.integer(forKey: key.rawValue)
    }
}

extension Pref {
    static func remove(key: KeyDefaults) {
        UserDefaults.standard.removeObject(forKey: key.rawValue)
    }
    
    static func clearPref() {
        
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        }
        
        UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
        UserDefaults.standard.synchronize()
    }
}
