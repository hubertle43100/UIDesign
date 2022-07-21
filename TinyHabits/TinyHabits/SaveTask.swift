//
//  SaveTask.swift
//  TinyHabits
//
//  Created by Hubert Le on 7/21/22.
//

import SwiftUI

struct SaveTask: View {
    var task: String
    @State var progressValue: Float
    var body: some View {
        VStack {
            Header()
            Spacer()
            Text(task).font(Font.custom("SourceCodePro-Bold", size: 20))
                .multilineTextAlignment(.center)
                .padding(.leading,10)
                .padding(.trailing,10)
            Text("________________________")
            Spacer()
            VStack {
                ProgressBar(value: $progressValue).frame(height: 20)
            }.padding()
            Spacer()
        }
        
    }
}

struct ProgressBar: View {
    @Binding var value: Float
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle().frame(width: geometry.size.width , height: geometry.size.height)
                    .opacity(0.3)
                    .foregroundColor(Color(UIColor.systemTeal))
                
                Rectangle().frame(width: min(CGFloat(self.value)*geometry.size.width, geometry.size.width), height: geometry.size.height)
                    .foregroundColor(Color(UIColor.systemBlue))
            }.cornerRadius(45.0)
        }
    }
}

struct SaveTask_Previews: PreviewProvider {
    static var previews: some View {
        SaveTask(task: "Getting up mile time up to help my mental and overall fitness to participate in future runs.", progressValue: 0.2)
    }
}
