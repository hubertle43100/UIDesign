//
//  TaskTitle.swift
//  TinyHabits
//
//  Created by Hubert Le on 7/27/22.
//

import Foundation
import SwiftUI

struct TaskTitle: View {
    @State var TitleTextfield: String = ""
    @Binding var rootIsActive : Bool
    @State var color: Color = Color.white
    @State var fore: Color = Color.blue
    var colorData = ColorData()
    
    var body: some View {
        ZStack {
            color
            .ignoresSafeArea()
            .frame(height: .infinity)
            VStack {
                Header(Title: "Tiny Habits")
                Image("box")
                    .resizable()
                    .padding()
                    .background(fore)
                    .frame(width: 125, height: 125)
                    .cornerRadius(10)
                Text("Make your task as specific as possible. Doing this will allow you to visualize yourself in the position of practicing building your new habit. (At least 30 characters)").padding().font(Font.custom("SourceCodePro-Bold", size: 14))
                    .frame(width: 350)
                    .multilineTextAlignment(.leading)
                TextField("10 Push ups after going to the restroom", text: $TitleTextfield)
                    .padding()
                    .background(Color.gray.opacity(0.3).cornerRadius(10))
                    .font(Font.custom("SourceCodePro-Bold", size: 13))
                    .padding()
                
                if isValidTask() {
                    NavigationLink(destination: TaskBubbles(task: TitleTextfield, rootIsActive: self.$rootIsActive),
                                   label: {
                        Text("Continue to Task Analysis")
                            .padding()
                            .foregroundColor(.white)
                            .background(fore)
                            .cornerRadius(8)
                            .font(Font.custom("SourceCodePro-Bold", size: 15))
                        
                    }).isDetailLink(false)
                }
                Spacer()
            }
        }.onAppear {
            color = colorData.loadColor()
            fore = colorData.loadForegroundColor()
        }
    }
    func isValidTask() -> Bool {
        if TitleTextfield.count >= 30 {
            return true
        }
        return false
    }
    
}


