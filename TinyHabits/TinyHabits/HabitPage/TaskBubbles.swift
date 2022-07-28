//
//  TaskBubbles.swift
//  TinyHabits
//
//  Created by Hubert Le on 7/21/22.
//

import SwiftUI

struct TaskBubbles: View {
    var task: String
    @State var isDiffClicked: Bool = false
    @State var isMotiClicked: Bool = false
    @State var ratingD: Int = 0
    @State var ratingM: Int = 0
    
    
    var body: some View {
        
        VStack{
            Header()
            Spacer()
            Text(task).font(Font.custom("SourceCodePro-Bold", size: 20))
                .multilineTextAlignment(.center)
                .padding(.leading,10)
                .padding(.trailing,10)
            Text("________________________")
            Spacer()
            Group {
                Text("Difficulty of Task").padding()
                HStack {
                    ForEach(1..<11) { index in
                        Image(systemName: "circle.fill")
                            .font(.system(size: 15))
                            .foregroundColor(ratingD >= index ? Color.yellow : Color.gray)
                            .onTapGesture {
                                ratingD = index
                                isDiffClicked = true
                            }
                    }
                }.padding(.bottom)
                Text("Motivation for Task").padding()
                HStack {
                    ForEach(1..<11) { index in
                        Image(systemName: "circle.fill")
                            .font(.system(size: 15))
                            .foregroundColor(ratingM >= index ? Color.yellow : Color.gray)
                            .onTapGesture {
                                ratingM = index
                                isMotiClicked = true
                            }
                    }
                }
            }.font(Font.custom("SourceCodePro-Bold", size: 15))
            Spacer()
            if isDiffClicked && isMotiClicked {
                NavigationLink(destination: SaveTask(task: task, progressValue: Float(ratingD + ratingM)/20), label: {
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
}

struct TaskBubbles_Previews: PreviewProvider {
    static var previews: some View {
        TaskBubbles(task: "Getting up mile time up to help my mental and overall fitness to participate in future runs.")
    }
}
