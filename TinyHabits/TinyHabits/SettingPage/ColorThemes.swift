//
//  ColorThemes.swift
//  TinyHabits
//
//  Created by Hubert Le on 8/18/22.
//

import SwiftUI

struct ColorThemes: View {
    
    @State private var color: Color = Color.white
    private var colorData = ColorData()
    
    var body: some View {
        VStack {
            Header(Title: "Tiny Habits").padding(.bottom, 50)
            
            
            ColorPicker("Pick background color", selection: $color)
                .padding(.trailing, 30)
                .padding(.leading, 30)
                .padding()
                .background(Rectangle().fill(.white))
            Text("Color")
                .fixedSize(horizontal: false, vertical: true)
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(width: 300, height: 200)
                    .background(Rectangle().fill(.white))
                    .cornerRadius(20)

            Spacer()
            Button {
                colorData.saveColor(color: color)
            } label: {
                Text("Save")
                    .frame(width: 300, height: 50)
                    .font(Font.custom("SourceCodePro-Bold", size: 15))
                    .foregroundColor(.white)
                    .background(Color.gray)
                    .cornerRadius(8)
            }
            Spacer()
        }
            .onAppear {
                color = colorData.loadColor()
            }
            .background(color)
            .ignoresSafeArea()
        
    }
}

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
    
    func loadColor() -> Color {
        guard let array = userDefaults.object(forKey: COLOR_KEY) as? [CGFloat] else { return Color.black }
        
        let color = Color(.sRGB,
                          red: array[0],
                          green: array[1],
                          blue: array[2],
                          opacity: array[3])
        
        print(color)
        print("Color Loaded!!!")
        return color
    }
}

struct ColorThemes_Previews: PreviewProvider {
    static var previews: some View {
        ColorThemes()
    }
}
