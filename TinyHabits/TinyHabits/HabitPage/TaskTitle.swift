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
    
    var body: some View {
        VStack {
            Header(Title: "Tiny Habits")
            Image("FruitGirl")
                .resizable()
                .frame(width: 275, height: 210)
                .cornerRadius(10)
            Text("Make your task as specific as possible. Doing this will allow you to visualize yourself in the position of practicing building your new habit. (At least 20 characters)").padding().font(Font.custom("SourceCodePro-Bold", size: 14))
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
                        .background(Color.blue)
                        .cornerRadius(8)
                        .font(Font.custom("SourceCodePro-Bold", size: 15))
                    
                }).isDetailLink(false)
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
