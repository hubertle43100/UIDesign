//
//  MainGraph.swift
//  Design#8
//
//  Created by Hubert Le on 1/6/22.
//

import SwiftUI

struct MainGraph: View {
    @State var percent : CGFloat = 0
    @State var percent2 : CGFloat = 0
    
    var body: some View {
        HStack {
            VStack {
                Image("folder")
                    .resizable()
                .frame(width: 100, height: 100)
                Text("Existing")
                VStack {
                    CustomProgressView(percent: self.$percent, color1: Color(#colorLiteral(red: 0.9994661212, green: 0.979791224, blue: 0.9194086194, alpha: 1)), color2: Color.yellow)
                }.padding(.bottom)
                    .onTapGesture {
                        self.percent += 0.25
                        if self.percent == 1.25 {
                            self.percent = 0
                        }
                    }.animation(.spring())
            }.frame(width: 178, height: 200)
                .background(Color(#colorLiteral(red: 0.9994661212, green: 0.979791224, blue: 0.9194086194, alpha: 1)))
                .cornerRadius(20)
                .padding(.trailing)
            VStack {
                Image("file-and-folder")
                    .resizable()
                .frame(width: 100, height: 100)
                Text("Completed")
                VStack {
                    CustomProgressView(percent: self.$percent2, color1: Color(#colorLiteral(red: 0.9269135594, green: 0.9619827867, blue: 0.9998403192, alpha: 1)), color2: Color.blue)
                }.padding(.bottom)
                    .onTapGesture {
                        self.percent2 += 0.20
                        if self.percent2 == 1.20 {
                            self.percent2 = 0
                        }
                    }.animation(.spring())
            }.frame(width: 178, height: 200)
                .background(Color(#colorLiteral(red: 0.9269135594, green: 0.9619827867, blue: 0.9998403192, alpha: 1)))
                .cornerRadius(20)
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
    var color1: Color
    let color2: Color
     
    var body : some View {
        HStack {
            ZStack(alignment: .leading){
                ZStack{
                    Capsule().fill(Color.black.opacity(0.08)).frame(width: 100, height: 10)
                }
                
                Capsule()
                    .fill(LinearGradient(gradient: .init(colors: [color1,color2]), startPoint: .leading, endPoint: .trailing))
                    .frame(width: self.calPercent(), height: 10)
            }

        }
    }
    func calPercent() -> CGFloat {
        let width = 100
        
        return CGFloat(width) * self.percent
    }
}
