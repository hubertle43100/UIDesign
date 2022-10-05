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
        }
    }
}
