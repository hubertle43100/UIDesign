//
//  HabitMain.swift
//  TinyHabits
//
//  Created by Hubert Le on 7/7/22.
//

import SwiftUI

struct HabitMain: View {
    var body: some View {
        NavigationView {
            VStack {
                Header()
                NavigationLink(destination: TaskTitle(), label: {
                    Text("Start a New Tiny Habit")
                        .frame(width: 300, height: 100)
                        .foregroundColor(.white)
                        .background(Color.gray)
                        .cornerRadius(8)
                        .font(Font.custom("SourceCodePro-Bold", size: 15))
                }).padding()
                Spacer()
                
            }
        }.accentColor(Color(.label))
    }
}

struct TaskTitle: View {
    @State var TitleTextfield: String = ""
    
    var body: some View {
        VStack {
            Header()
            Image("GroupWork")
                .resizable()
                .frame(width: 275, height: 210)
                .cornerRadius(10)
            Text("Make your task as specific as possible. Doing this will allow you to visualize yourself in the position of practicing building your new habit. (At least 20 characters").padding().font(Font.custom("SourceCodePro-Bold", size: 13))
            TextField("10 Push ups after going to the restroom", text: $TitleTextfield)
                .padding()
                .background(Color.gray.opacity(0.3).cornerRadius(10))
                .font(Font.custom("SourceCodePro-Bold", size: 13))
                .padding()
            
            if isValidTask() {
                NavigationLink(destination: TaskBubbles(task: TitleTextfield), label: {
                    Text("Continue to Task Analysis")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(8)
                        .font(Font.custom("SourceCodePro-Bold", size: 15))
                    
                })
            }
            Spacer()
        }
    }
    func isValidTask() -> Bool {
        if TitleTextfield.count >= 20 {
            return true
        }
        return false
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

struct HabitMain_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HabitMain()
                .previewInterfaceOrientation(.portrait)
        }
    }
}
