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
                ScrollView {
                    VStack {
                        Header(Title: "Tiny Habits").padding(.bottom, 50)
                        taskUpdate(model: model)
                        
                        //Create New Task Button
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

//MARK: Display -> Title + Date
struct Header: View {
    var Title: String
    var body: some View {
        VStack {
            Text(Title).font(Font.custom("SourceCodePro-Bold", size: 30))
            Text("\(Date().formatted(.dateTime.month().day().hour().minute()))").font(Font.custom("SourceCodePro-Bold", size: 15))
            
        }
    }
}

//MARK: Task Model Update
struct taskUpdate: View {
    
    //Goes through array in CoreData model and display each one
    
    @State var fore: Color = Color.blue
    var colorData = ColorData()
    
    @StateObject var model: CoreDataViewModel
    @State private var stroken = false
    
    @State private var willMoveToNextScreen = false
    
    var body: some View {
        ForEach(model.savedEntities) { entity in
            Button(action: {
                
            }) {
                VStack {
                    Text(entity.task ?? "Task Not found!")
                        .strikethrough(entity.isComplete)
                        .padding()
                        .foregroundColor(.white)
                }.frame(width: 300, height: 100)
                    .foregroundColor(.white)
                    .background(entity.isComplete ? Color.green : fore)
                    .cornerRadius(8)
                    .font(Font.custom("SourceCodePro-Bold", size: 15))
                    .onAppear {
                        fore = colorData.loadForegroundColor()
                    }
                    .onLongPressGesture(minimumDuration: 0.1) {
                        let impactHeavy = UIImpactFeedbackGenerator(style: .heavy)
                        impactHeavy.impactOccurred()
                        model.completeTask(entity: entity)
                    }
            }
        }
    }
}

