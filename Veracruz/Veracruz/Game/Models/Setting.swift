//
//  Setting.swift
//  Veracruz
//
//  Created by Amarjit on 30/10/2025.
//

enum Preference {
    case sound(toggle: Bool)
    case music(toggle: Bool)
    case darkMode(toggle: Bool)
}

struct Setting {
    let settings: [Preference]
    
    init(settings: [Preference]) {
        self.settings = settings
    }
    
    public func toggle(pref: Preference) {
        
    }
}
