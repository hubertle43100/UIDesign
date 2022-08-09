//
//  hourTask.swift
//  Design#8
//
//  Created by Hubert Le on 1/11/22.
//

import SwiftUI

struct hourTask: View {
    var body: some View {
        VStack {
            HStack {
                Capsule()
                    .foregroundColor(Color(#colorLiteral(red: 0.3608738482, green: 0.853882134, blue: 0.9670757651, alpha: 1)))
                    .frame(width: 10, height: 30)
                    .padding(.bottom)
                VStack {
                    Text("46")
                        .font(.system(size: 20).bold())
                    Text("Hour")
                        .opacity(0.5)
                }.padding(.trailing,5)
                Capsule()
                    .foregroundColor(Color(#colorLiteral(red: 0.9579486251, green: 0.6744003892, blue: 0.4148384929, alpha: 1)))
                    .frame(width: 10, height: 30)
                    .padding(.bottom)
                VStack {
                    Text("20")
                        .font(.system(size: 20).bold())
                    Text("Task")
                        .opacity(0.5)
                }
                
            }.frame(width: 150, height: 60)
                .background(.white)
                .opacity(0.8)
            .cornerRadius(20)
        }
    }
}

struct hourTask_Previews: PreviewProvider {
    static var previews: some View {
        hourTask()
    }
}
