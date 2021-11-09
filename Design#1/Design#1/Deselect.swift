//
//  Deselect.swift
//  Design#1
//
//  Created by Hubert Le on 11/9/21.
//

import SwiftUI

struct Deselect: View {
    var body: some View {
        HStack {
            Text("Deselect")
                .foregroundColor(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                .bold()
            Spacer()
            Image(systemName: "chevron.right")
                .frame(width: 30, height: 30)
                .background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                .foregroundColor(.white)
                .cornerRadius(15)
        }
        .padding(.horizontal, 30)
    }
}

struct Deselect_Previews: PreviewProvider {
    static var previews: some View {
        Deselect()
    }
}
