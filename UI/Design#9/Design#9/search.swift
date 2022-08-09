//
//  search.swift
//  Design#9
//
//  Created by Hubert Le on 1/12/22.
//

import SwiftUI

struct search: View {
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
                    Text("Searching for \(searchText)")
                        .searchable(text: $searchText, prompt: "Look for something")
                        .navigationTitle("Searchable Example")
                }
    }
}

struct search_Previews: PreviewProvider {
    static var previews: some View {
        search()
    }
}
