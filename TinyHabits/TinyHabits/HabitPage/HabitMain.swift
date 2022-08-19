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
                            Button(action: {
                                model.saveData()
                            }) {
                                Text("Update task")
                            }.padding()
                                .foregroundColor(.white)
                                .background(Color.green)
                                .cornerRadius(8)
                                .font(Font.custom("SourceCodePro-Bold", size: 15))
                            Spacer()
                        }.offset(y: -15)
                    }
                    
                }.navigationBarBackButtonHidden(true)
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
                    //ProgressBar(value: entity.progressValue).frame(height: 20)
//                        .padding(.leading)
//                        .padding(.trailing)
                }
            }.frame(width: 300, height: 100)
                .foregroundColor(.white)
                .background(Color.green)
                .cornerRadius(8)
                .font(Font.custom("SourceCodePro-Bold", size: 15))
        }
    }
}
