//
//  HabitMain.swift
//  TinyHabits
//
//  Created by Hubert Le on 7/7/22.
//

import SwiftUI
import UserNotifications

struct HabitMain: View {
    
    @StateObject var model: CoreDataViewModel
    @State var isActive : Bool = false
    @State var color: Color = Color.white
    @State var imageNotification: Bool = true
    var colorData = ColorData()
    
    var body: some View {
        NavigationView {
            ZStack {
                color
                    .ignoresSafeArea()
                ScrollView {
                    VStack {
                        TitleHeader()
                        //NotificationBell(imageNotification: imageNotification)
                        taskBar(model: model)
                        createTask(model: model, isActive: isActive)

                    }.navigationBarBackButtonHidden(true)
                        .onAppear {
                            model.saveData()
                        }
                }
            }.onAppear {
                color = colorData.loadColor()
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        imageNotification = false
                    } else if let error = error {
                        print(error.localizedDescription)
                    }
                }
            }
        }.accentColor(Color(.label))
            .navigationBarBackButtonHidden(true)
    }
}











//- MARK: Display -> Title + Date
struct Header: View {
    var Title: String
    
    var body: some View {
        VStack {
            BounceAnimationView(text: "\(Title)", startTime: 0.0)
        }
    }
}

//- MARK: Task Model Update
struct taskBar: View {
    //Goes through array in CoreData model and display each one
    
    @State var fore: Color = Color.blue
    var colorData = ColorData()
    
    @StateObject var model: CoreDataViewModel
    @State private var stroken = false
    
    @State private var willMoveToNextScreen = false
    @State var counter = 0
    var timer = Timer.publish(every: 10, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ForEach(model.savedEntities) { entity in
            Button(action: {
                
            }) {
                HStack {
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
                        .onReceive(timer) { time in
                            if counter % 5 == 0 {
//                                model.daysCounted()
//                                model.resetTask()
//                                entity.isComplete = false
                            } else {
                                print("")
                            }
                            counter += 1
                        }
                        .onAppear {
                            fore = colorData.loadForegroundColor()
                        }
                        .onLongPressGesture(minimumDuration: 0.3) {
                            let impactHeavy = UIImpactFeedbackGenerator(style: .heavy)
                            impactHeavy.impactOccurred()
                            model.completeTask(entity: entity)
                    }
                    NavigationLink(destination: TaskDetailView(CircleProgress: entity.daysCount, task: entity.task ?? "...", isComplete: entity.isComplete), label: {
                        Image(systemName: "arrow.right.circle")
                            .frame(width: 50, height: 100)
                            .foregroundColor(.white)
                            .background(entity.isComplete ? Color.green : fore)
                            .cornerRadius(8)
                            .font(Font.custom("SourceCodePro-Bold", size: 20))
                    })
                }
            }
        }
    }
}

struct createTask: View {
    @StateObject var model: CoreDataViewModel
    @State var isActive : Bool
    
    var body: some View {
        if model.savedEntities.count < 3 {
            Group {
                NavigationLink(destination: TaskTitleView(rootIsActive: $isActive),isActive: self.$isActive, label: {
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
    }
}

struct TitleHeader: View {
    var timer2 = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let date = Date()
    @State var secondStr: String = ""
    
    var body: some View {
        VStack {
            Header(Title: "Tiny Habits")
            Text(secondStr)
                .onReceive(timer2) { (_) in
                    self.secondStr = self.date.formatted(.dateTime.month().day().hour().minute())
                }
                .font(Font.custom("SourceCodePro-Bold", size: 15))
                .padding(.bottom, 50)
        }
    }
}

//struct NotificationBell: View {
//    @State var imageNotification: Bool
//
//    var body: some View {
//        if (imageNotification) {
//            Button(action: {
//                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
//                    if success {
//                        imageNotification = false
//                    } else if let error = error {
//                        print(error.localizedDescription)
//                    }
//                }
//            }) {
//                Image(systemName: "bell")
//                    .frame(width: 50, height: 50)
//                    .foregroundColor(.white)
//                    .background(Color.gray)
//                    .cornerRadius(8)
//                    .font(Font.custom("SourceCodePro-Bold", size: 15))
//            }
//        }
//    }
//}
