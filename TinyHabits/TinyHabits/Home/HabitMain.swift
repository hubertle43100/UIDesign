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
    @State var color: Color = Color.white
    var colorData = ColorData()
    
    var body: some View {
        NavigationView {
            ZStack {
                color
                    .ignoresSafeArea()
                    .frame(height: .infinity)
                ScrollView {
                    VStack {
                        Header(Title: "Tiny Habits").padding(.bottom, 50)
                        taskUpdate(model: model)
                        if model.savedEntities.count < 3 {
                            Group {
                                NavigationLink(destination: TaskTitle(rootIsActive: $isActive),isActive: self.$isActive, label: {
                                    Text("Start a New Tiny Habit")
                                        .frame(width: 300, height: 100)
                                        .foregroundColor(.white)
                                        .background(Color.gray)
                                        .cornerRadius(8)
                                        .font(Font.custom("SourceCodePro-Bold", size: 15))
                                }).isDetailLink(false)
                                    .padding()
                                Spacer()
                            }.offset(y: -15)
                        }
                        
                    }.navigationBarBackButtonHidden(true)
                        .onAppear {
                            model.saveData()
                        }
                }
            }.onAppear {
                color = colorData.loadColor()
            }
        }.accentColor(Color(.label))
            .navigationBarBackButtonHidden(true)
    }
}




struct Header: View {
    var Title: String
    var body: some View {
        VStack {
            Text(Title).font(Font.custom("SourceCodePro-Bold", size: 30))
            Text("\(Date().formatted(.dateTime.month().day().hour().minute()))").font(Font.custom("SourceCodePro-Bold", size: 15))
            
        }
    }
}

struct taskUpdate: View {
    @StateObject var model: CoreDataViewModel
    
    var body: some View {
        ForEach(model.savedEntities) { entity in
            Button {
                model.quickDeleteHabit()
            } label: {
                VStack {
                    Text(entity.task ?? "Task Not found!")
                        .padding()
                }
            }.frame(width: 300, height: 100)
                .foregroundColor(.white)
                .background(Color.black)
                .cornerRadius(8)
                .font(Font.custom("SourceCodePro-Bold", size: 15))
        }
    }
}
