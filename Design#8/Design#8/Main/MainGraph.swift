//
//  MainGraph.swift
//  Design#8
//
//  Created by Hubert Le on 1/6/22.
//

import SwiftUI

struct MainGraph: View {
    @State var percent : CGFloat = 0
    
    var body: some View {
        VStack {
            Image("folder")
                .resizable()
                .frame(width: 100, height: 100)
            Text("Existing")
            VStack {
                CustomProgressView(percent: self.$percent)
            }.padding()
                .onTapGesture {
                    self.percent += 0.25
                    if self.percent == 1.25 {
                        self.percent = 0
                    }
                }.animation(.spring())
        }.padding()
    }
}

struct MainGraph_Previews: PreviewProvider {
    static var previews: some View {
        MainGraph()
    }
}

struct CustomProgressView: View {
    @Binding var percent: CGFloat
     
    var body : some View {
        ZStack(alignment: .leading){
            ZStack{
                Capsule().fill(Color.black.opacity(0.08)).frame(width: 100, height: 10)
            }
            
            Capsule()
                .fill(LinearGradient(gradient: .init(colors: [Color.blue,Color.yellow]), startPoint: .leading, endPoint: .trailing))
                .frame(width: self.calPercent(), height: 10)
        }
    }
    func calPercent() -> CGFloat {
        let width = 100
        
        return CGFloat(width) * self.percent
    }
}
