//
//  HabitMain.swift
//  TinyHabits
//
//  Created by Hubert Le on 7/7/22.
//

import SwiftUI

struct HabitMain: View {
    @StateObject var model: CoreDataViewModel
    @State var isActive : Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Header().padding(.bottom, 50)
                ForEach(model.savedEntities) { entity in
                    //progressValue = entity.progressValue
                    Button {
                        model.quickDeleteHabit()
                    } label: {
                        VStack {
                            Text(entity.task ?? "Task Not found!")
                            //ProgressBar(value: $progressValue).frame(height: 20)
                                .padding(.leading)
                                .padding(.trailing)
                        }
                    }.frame(width: 300, height: 100)
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(8)
                        .font(Font.custom("SourceCodePro-Bold", size: 15))
                }
                NavigationLink(destination: TaskTitle(), label: {
                    Text("Start a New Tiny Habit")
                        .frame(width: 300, height: 100)
                        .foregroundColor(.white)
                        .background(Color.gray)
                        .cornerRadius(8)
                        .font(Font.custom("SourceCodePro-Bold", size: 15))
                }).padding()
                Spacer()
                
            }.navigationBarBackButtonHidden(true)
        }.accentColor(Color(.label))
            .navigationBarBackButtonHidden(true)
    }
}




struct Header: View {
    var body: some View {
        VStack {
            Text("Tiny Habits").font(Font.custom("SourceCodePro-Bold", size: 30))
            Text("\(Date().formatted(.dateTime.month().day().hour().minute()))").font(Font.custom("SourceCodePro-Bold", size: 15))
            
        }
    }
}
