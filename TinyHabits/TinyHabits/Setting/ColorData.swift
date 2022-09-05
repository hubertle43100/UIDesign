//
//  ColorData.swift
//  TinyHabits
//
//  Created by Hubert Le on 8/22/22.
//

import SwiftUI

struct ColorData {
    
    private var COLOR_KEY = "COLOR_KEY"
    private var userDefaults = UserDefaults.standard
    
    func saveColor(color: Color) {
        let color = UIColor(color).cgColor
        
        if let components = color.components {
            userDefaults.set(components, forKey: COLOR_KEY)
            print(components)
            print("Colour saved!!!")
        }
    }
}

struct ColorData_Previews: PreviewProvider {
    static var previews: some View {
        ColorData()
    }
}
