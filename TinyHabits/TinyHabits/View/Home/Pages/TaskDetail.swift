//
//  TaskDetail.swift
//  TinyHabits
//
//  Created by Hubert Le on 9/15/22.
//

import SwiftUI

struct TaskDetail: View {
    var days: Int = 5
    
    var body: some View {
        VStack {
            Header(Title: "Task Detail")
            Text("TASK TITLE HERE")
                .frame(width: 300, height: 100)
                .foregroundColor(.white)
                .background(Color.gray)
                .cornerRadius(8)
                .padding()
                .font(Font.custom("SourceCodePro-Bold", size: 15))
            Text("Days in a row: \(days)")
                .font(Font.custom("SourceCodePro-Bold", size: 15))
                .padding(.bottom, 10)
            ZStack {
                Circle()
                    .stroke(Color.green.opacity(0.5), lineWidth: 30)
                    .frame(width: 200, height: 200)
                Circle()
                    .trim(from: 0, to: 0.25)
                    .stroke(Color.green, style: StrokeStyle(
                        lineWidth: 30,
                        lineCap: .round
                    ))
                    .frame(width: 200, height: 200)
                    .rotationEffect(.degrees(-90))
                    .animation(.easeOut, value: days)
                Text("\(days)/21")
                    .font(Font.custom("SourceCodePro-Bold", size: 40))
                    .bold()
            }.padding()
            Text("It only takes averagely about 21 days to build a stable habit. Keep it up!")
                .frame(width: 300, height: 100)
                .font(Font.custom("SourceCodePro-Bold", size: 15))
            
        }
    }
}

struct TaskDetail_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetail()
    }
}
