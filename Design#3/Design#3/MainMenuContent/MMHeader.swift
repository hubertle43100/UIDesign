//
//  MMHeader.swift
//  Design#3
//
//  Created by Hubert Le on 11/16/21.
//

import SwiftUI

struct MMHeader: View {
    var body: some View {
        HStack {
            ItemBubble(ItemName: "square.grid.2x2")
            Spacer()
            ItemBubble(ItemName: "magnifyingglass")
            ItemBubble(ItemName: "bell.badge")
        }.frame(width: 350, height: 50, alignment: .center)
    }
}

struct MMHeader_Previews: PreviewProvider {
    static var previews: some View {
        MMHeader()
    }
}

struct ItemBubble: View {
    var ItemName: String
    
    var body: some View {
        VStack {
            Image(systemName: ItemName)
                .foregroundColor(Color(#colorLiteral(red: 0.215388298, green: 0.6241750717, blue: 0.9968780875, alpha: 1)))
                .padding()
                .background(Color(#colorLiteral(red: 0.8574994206, green: 0.9277706146, blue: 0.9992104173, alpha: 1)))
                .clipShape(Circle())
            
        }
    }
}
