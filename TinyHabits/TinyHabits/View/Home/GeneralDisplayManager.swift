//
//  GeneralDisplayManager.swift
//  TinyHabits
//
//  Created by Hubert Le on 10/4/22.
//

import Foundation
import SwiftUI

struct TaskDisplay: View {
    @State var isComplete: Bool
    var task: String
    var title: String
    @State var fore: Color
    var colorData = ColorData()
    
    var body: some View {
        VStack {
            BounceAnimationView(text: "\(title)", startTime: 0.0)
            VStack {
                Text(task)
                    .strikethrough(isComplete)
                    .padding()
            }.foregroundColor(.white)
                .frame(width: 300, height: 100)
                .background(fore)
                .cornerRadius(8)
                .font(Font.custom("SourceCodePro-Bold", size: 15))
        }.onAppear {
            fore = colorData.loadForegroundColor()
        }
        .padding(.bottom, 50)
            
    }
}
