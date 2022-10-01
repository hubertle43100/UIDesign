//
//  TaskDetail.swift
//  TinyHabits
//
//  Created by Hubert Le on 9/15/22.
//

import SwiftUI

struct TaskDetail: View {
    var CircleProgress: Float
    var task: String
    @State var isComplete: Bool
    
    @StateObject var vm = CoreDataViewModel()
    
    var body: some View {
        let formattedFloat = String(format: "%.0f", CircleProgress)
        VStack {
            Header(Title: "Task Detail")
            TaskTop(isComplete: isComplete, formattedFloat: formattedFloat, task: task)
            CircleDisplay(CircleProgress: CircleProgress, formattedFloat: formattedFloat)
            Fact()
            Button(action: {
                
            }) {
                Image(systemName: "trash")
                    .foregroundColor(Color.black)
                    .font(.system(size: 20))
            }
        }
    }
}

struct TaskDetail_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetail(CircleProgress: 1, task: "Going to gym before 7 am", isComplete: true)
    }
}










struct CircleWheel: View {
    var CircleProgress: Float
    var body: some View {
        switch CircleProgress {
        case 0...7:
            CircleColors(circleColor: Color.red, CircleProgress: CircleProgress)
        case 8...14:
            CircleColors(circleColor: Color.yellow, CircleProgress: CircleProgress)
        case 15...21:
            CircleColors(circleColor: Color.green, CircleProgress: CircleProgress)
        default:
            Text("Error in there is a value out of bounds")
        }
    }
}
struct CircleColors: View {
    var circleColor: Color
    var CircleProgress: Float
    
    var body: some View {
        Circle()
            .stroke(circleColor.opacity(0.5), lineWidth: 30)
            .frame(width: 200, height: 200)
        Circle()
            .trim(from: 0, to: CGFloat(CircleProgress)/21)
            .stroke(circleColor, style: StrokeStyle(
                lineWidth: 30,
                lineCap: .round
            ))
            .frame(width: 200, height: 200)
            .rotationEffect(.degrees(-90))
            .animation(.easeOut, value: CircleProgress)
    }
    
}

struct TaskTop: View {
    @State var isComplete: Bool
    let formattedFloat: String
    var task: String
    
    var body: some View {
        VStack {
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
        }
    }
}

struct Fact: View {
    var body: some View {
        Text("It only takes averagely about 21 days to build a stable habit. Keep it up!")
            .frame(width: 300, height: 100)
            .font(Font.custom("SourceCodePro-Bold", size: 15))
    }
}

struct CircleDisplay: View {
    var CircleProgress: Float
    let formattedFloat: String
    
    var body: some View {
        ZStack {
            CircleWheel(CircleProgress: CircleProgress)
            Text("\(formattedFloat)/21")
                .font(Font.custom("SourceCodePro-Bold", size: 40))
                .bold()
        }.padding()
    }
}
