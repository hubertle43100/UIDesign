//
//  Header.swift
//  Design#4
//
//  Created by Hubert Le on 11/17/21.
//

import SwiftUI

struct Header: View {
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(Color.gray)
            HeaderBar()
            Image(systemName: "location")
                .foregroundColor(Color.gray)
        }
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header()
    }
}
