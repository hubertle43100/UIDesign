//
//  WhiteContents.swift
//  Design#10
//
//  Created by Hubert Le on 1/26/22.
//

import SwiftUI

struct WhiteContents: View {
    var body: some View {
        VStack {
            HStack {
                Text("New")
                Spacer()
                Text("Bestsellers")
                Spacer()
                Text("Premium")
                    .frame(width:100, height: 30)
                    .background(.black)
                    .cornerRadius(30)
                    .foregroundColor(.white)
                Spacer()
                Text("Best Value")
            }.frame(width: UIScreen.main.bounds.width - 50, alignment: .center)
            
        }
    }
}

struct WhiteContents_Previews: PreviewProvider {
    static var previews: some View {
        WhiteContents()
    }
}
