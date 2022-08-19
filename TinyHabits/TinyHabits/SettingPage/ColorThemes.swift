//
//  ColorThemes.swift
//  TinyHabits
//
//  Created by Hubert Le on 8/18/22.
//

import SwiftUI

struct ColorThemes: View {
    
    let colors :[Color] = [.red, .yellow, .green, .blue]
    @Binding var selectedColor: Color
    
    @State private var backgroundColor = Color.white
    var body: some View {
        VStack {
            Header(Title: "Tiny Habits")
            ForEach(colors, id: \.self) { (color) in
                Button {
                    
                } label: {
                    Text("Color")
                        .frame(width: 300, height: 50)
                        .font(Font.custom("SourceCodePro-Bold", size: 15))
                        .foregroundColor(.white)
                        .background(Color.gray)
                        .cornerRadius(8)
                }
            }
            Spacer()
            Button {
                
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
    }
}

struct ColorThemes_Previews: PreviewProvider {
    static var previews: some View {
        ColorThemes(selectedColor: .constant(.blue))
    }
}
