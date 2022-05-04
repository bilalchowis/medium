//
//  GeneralPreferences.swift
//  Medium
//
//  Created by Bilal Bakhrom on 04/05/2022.
//

import UIKit

final class GeneralPreferences {
    static let shared = GeneralPreferences()
    private let defaults: UserDefaults
        
    private init() {
        defaults = UserDefaults.standard
        defaults.register(defaults: [
            StorageKey.userInterfaceStyle.value: UIUserInterfaceStyle.dark.rawValue,
        ])
    }
    
    var userInterfaceStyle: UIUserInterfaceStyle {
        get {
            let rawValue = defaults.integer(forKey: StorageKey.userInterfaceStyle.value)
            return UIUserInterfaceStyle(rawValue: rawValue)!
        } set {
            defaults.set(newValue.rawValue, forKey: StorageKey.userInterfaceStyle.value)
        }
    }
}
