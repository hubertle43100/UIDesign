//
//  TaskBubbles.swift
//  TinyHabits
//
//  Created by Hubert Le on 7/21/22.
//

import SwiftUI

struct TaskBubbles: View {
    var task: String
    var colorData = ColorData()
    @State var isDiffClicked: Bool = false; @State var isMotiClicked: Bool = false
    @State var ratingD: Int = 0; @State var ratingM: Int = 0
    @State var color: Color = Color.white;@State var fore: Color = Color.blue
    @Binding var rootIsActive : Bool
    
    var body: some View {
        
        ZStack {
            color
                .ignoresSafeArea()
                .frame(height: .infinity)
            VStack{
                Title(task: task)
                SelectDifficulty(ratingD: ratingD, ratingM: ratingM, isDiffClicked: isDiffClicked, isMotiClicked: isMotiClicked, fore: fore);Spacer()
                NextButton(task: task, isDiffClicked: isDiffClicked, isMotiClicked: isMotiClicked, fore: fore, ratingD: ratingD, ratingM: ratingM, rootIsActive: $rootIsActive);Spacer()
            }
        }.onAppear {
            color = colorData.loadColor()
            fore = colorData.loadForegroundColor()
        }
    }
}











struct Title: View {
    var task: String
    
    var body: some View {
        Header(Title: "Tiny Habits");Spacer()
        Text(task).font(Font.custom("SourceCodePro-Bold", size: 20))
            .multilineTextAlignment(.center)
            .padding(.leading,10)
            .padding(.trailing,10)
        Text("________________________");Spacer()
    }
}

struct SelectDifficulty: View {
    @State var ratingD: Int
    @State var ratingM: Int
    
    @State var isDiffClicked: Bool
    @State var isMotiClicked: Bool
    
    @State var fore: Color
    
    var body: some View {
        Group {
            Text("Difficulty of Task").padding()
            HStack {
                ForEach(1..<11) { index in
                    Image(systemName: "circle.fill")
                        .font(.system(size: 15))
                        .foregroundColor(ratingD >= index ? fore : Color.gray)
                        .onTapGesture {
                            ratingD = index
                            isDiffClicked = true
                        }
                }
            }.padding(.bottom,5)
            HStack {
                Text("Hard");Spacer();Text("Easy")
            }.frame(width: 300)
                .padding(.bottom)
            
            
            Text("Motivation for Task").padding()
            HStack {
                ForEach(1..<11) { index in
                    Image(systemName: "circle.fill")
                        .font(.system(size: 15))
                        .foregroundColor(ratingM >= index ? fore : Color.gray)
                        .onTapGesture {
                            ratingM = index
                            isMotiClicked = true
                        }
                }
            }.padding(.bottom,5)
            HStack {
                Text("Low");Spacer();Text("High")
            }.frame(width: 300)
                .padding(.bottom)
        }.font(Font.custom("SourceCodePro-Bold", size: 15))
    }
}

struct NextButton: View {
    var task: String
    
    @State var isDiffClicked: Bool
    @State var isMotiClicked: Bool
    @State var fore: Color
    
    @State var ratingD: Int
    @State var ratingM: Int
    
    @Binding var rootIsActive : Bool
    
    var body: some View {
        if isDiffClicked && isMotiClicked {
            NavigationLink(destination: TaskSave(task: task, shouldPopToRootView: self.$rootIsActive, progressValue: Float(ratingD + ratingM)/20), label: {
                Text("Continue to Task Analysis")
                    .padding()
                    .foregroundColor(.white)
                    .background(fore)
                    .cornerRadius(8)
                    .font(Font.custom("SourceCodePro-Bold", size: 15))
                
            }).isDetailLink(false)
        }
    }
}
