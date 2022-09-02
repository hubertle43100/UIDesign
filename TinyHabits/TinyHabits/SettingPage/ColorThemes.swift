//
//  ColorThemes.swift
//  TinyHabits
//
//  Created by Hubert Le on 8/18/22.
//

import SwiftUI

struct ColorThemes: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var color: Color = Color.white
    private var colorData = ColorData()
    
    var names: [String] = ["Default white","Forest Green", "Pink Blush", "Twitter Blue"]
    var colors: [Color] = [Color.white, Color(.init(srgbRed: 59/255, green: 174/255, blue: 78/255, alpha: 1.0)), Color(.init(srgbRed: 255/255, green: 148/255, blue: 148/255, alpha: 1.0)), Color(.init(srgbRed: 29/255, green: 161/255, blue: 242/255, alpha: 1.0))]
    
    var body: some View {
        NavigationView {
            VStack {
                Header(Title: "Tiny Habits").padding(.bottom, 50)
                VStack {
                    ForEach(Array(names.enumerated()),id: \.offset) { index, element in
                        Button {
                            color = colors[index]
                            colorData.saveColor(color: color)
                        } label: {
                            ColorButton(NameColor: names[index], ButtonColor: colors[index])
                        }
                        
                    }
                }
                Button(action : { self.presentationMode.wrappedValue.dismiss()
                    
                }){
                    ColorButton(NameColor: "Save", ButtonColor: Color.gray)
                }
                
                Spacer()
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(color)
                .onAppear {
                    color = colorData.loadColor()
                }
        }
        
    }
}

struct ColorButton: View {
    var NameColor: String
    var ButtonColor: Color
    
    var body: some View {
        VStack {
            Text(NameColor)
                .frame(width: 300, height: 50)
                .font(Font.custom("SourceCodePro-Bold", size: 15))
                .foregroundColor(.black)
                .background(ButtonColor)
                .cornerRadius(8)
        }
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

extension View {
    /// Navigate to a new view.
    /// - Parameters:
    ///   - view: View to navigate to.
    ///   - binding: Only navigates when this condition is `true`.
    func navigate<NewView: View>(to view: NewView, when binding: Binding<Bool>) -> some View {
        NavigationView {
            ZStack {
                self
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                
                NavigationLink(
                    destination: view
                        .navigationBarTitle("")
                        .navigationBarHidden(true),
                    isActive: binding
                ) {
                    EmptyView()
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}
