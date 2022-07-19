//
//  HabitMain.swift
//  TinyHabits
//
//  Created by Hubert Le on 7/7/22.
//

import SwiftUI

struct HabitMain: View {
    var body: some View {
        VStack {
            Text("Tiny Habits").font(Font.custom("SourceCodePro-Bold", size: 30))
            Group {
                Text("\(Date().formatted(.dateTime.month().day().hour().minute()))")
                Spacer()
                Button(action: { }, label: {
                  Text("Start a New Tiny Habit")
                    .frame(width: 300, height: 100)
                    .foregroundColor(.white)
                    .background(Color.gray)
                    .cornerRadius(8)
                    
                }).padding()
                
                Button(action: { }, label: {
                  Text("Start a New Tiny Habit")
                    .frame(width: 300, height: 100)
                    .foregroundColor(.white)
                    .background(Color.gray)
                    .cornerRadius(8)
                    
                }).padding()
                Button(action: { }, label: {
                  Text("Start a New Tiny Habit")
                    .frame(width: 300, height: 100)
                    .foregroundColor(.white)
                    .background(Color.gray)
                    .cornerRadius(8)
                    
                }).padding()
                Spacer()
            }.font(Font.custom("SourceCodePro-Bold", size: 15))
        }
    }
}

struct HabitMain_Previews: PreviewProvider {
    static var previews: some View {
        HabitMain()
    }
}
