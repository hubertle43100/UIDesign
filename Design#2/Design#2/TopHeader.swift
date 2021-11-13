//
//  TopHeader.swift
//  Design#2
//
//  Created by Hubert Le on 11/12/21.
//

import SwiftUI

struct TopHeader: View {
    var body: some View {
            HStack {
                Image(systemName: "chevron.backward")
                    .font(.system(size: 19).bold())
                Spacer()
                Text("Coffee ordering")
                    .font(.system(size: 19, weight: .medium))
                Spacer()
            }.padding(.horizontal, 30)
    }
}

struct TopHeader_Previews: PreviewProvider {
    static var previews: some View {
        TopHeader()
    }
}
