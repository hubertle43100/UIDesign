//
//  TaskDetail.swift
//  TinyHabits
//
//  Created by Hubert Le on 9/15/22.
//

import SwiftUI

struct TaskDetail: View {
    @State var CircleProgress: Float
    var task: String
    @State var isComplete: Bool
    
    var body: some View {
        let formattedFloat = String(format: "%.0f", CircleProgress)
        VStack {
            Header(Title: "Task Detail")
            VStack {
                Text(task)
                    .strikethrough(isComplete)
                    .padding()
            }.foregroundColor(.black)
            .frame(width: 300, height: 100)
            .background(Color(.init(srgbRed: 233/255, green: 233/255, blue: 233/255, alpha: 1.0)))
                .cornerRadius(8)
                .font(Font.custom("SourceCodePro-Bold", size: 15))
            Text("Days in a row: \(formattedFloat)")
                .font(Font.custom("SourceCodePro-Bold", size: 15))
                .padding(.bottom, 10)
            ZStack {
                Circle()
                    .stroke(Color.green.opacity(0.5), lineWidth: 30)
                    .frame(width: 200, height: 200)
                Circle()
                    .trim(from: 0, to: CGFloat(CircleProgress)/21)
                    .stroke(Color.green, style: StrokeStyle(
                        lineWidth: 30,
                        lineCap: .round
                    ))
                    .frame(width: 200, height: 200)
                    .rotationEffect(.degrees(-90))
                    .animation(.easeOut, value: CircleProgress)
                Text("\(formattedFloat)/21")
                    .font(Font.custom("SourceCodePro-Bold", size: 40))
                    .bold()
            }.padding()
            Text("It only takes averagely about 21 days to build a stable habit. Keep it up!")
                .frame(width: 300, height: 100)
                .font(Font.custom("SourceCodePro-Bold", size: 15))
            Image(systemName: "arrow.right.circle")
        }
    }
}

struct TaskDetail_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetail(CircleProgress: 11, task: "Going to gym before 7 am", isComplete: true)
    }
}
