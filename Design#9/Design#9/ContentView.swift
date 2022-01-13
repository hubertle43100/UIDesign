//
//  ContentView.swift
//  Design#9
//
//  Created by Hubert Le on 1/11/22.
//

import SwiftUI

struct ContentView: View {
    @Binding var text: String
 
    @State private var isEditing = false
    var body: some View {
        HStack {
         
                    TextField("Search ...", text: $text)
                        .padding(7)
                        .padding(.horizontal, 25)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .overlay(
                            HStack {
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(.gray)
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading, 8)
                         
                                if isEditing {
                                    Button(action: {
                                        self.text = ""
                                    }) {
                                        Image(systemName: "multiply.circle.fill")
                                            .foregroundColor(.gray)
                                            .padding(.trailing, 8)
                                    }
                                }
                            }
                        )

                        .padding(.horizontal, 10)
                        .onTapGesture {
                            self.isEditing = true
                        }
         
                    if isEditing {
                        Button(action: {
                            self.isEditing = false
                            self.text = ""
         
                        }) {
                            Text("Cancel")
                        }
                        .padding(.trailing, 10)
                        .transition(.move(edge: .trailing))
                        .animation(.default)
                    }
                }
            }
}
//        Group {
//            VStack {
//                HStack {
//                    Image("1574122306")
//                        .resizable()
//                        .frame(width: 50, height: 50)
//                        .cornerRadius(50)
//                    Spacer()
//                    Image("location_on")
//                        .resizable()
//                        .frame(width: 20, height: 20)
//                    Text("Country in North America")
//                    Spacer()
//                    Image(systemName: "bell")
//                }
//                HStack {
//                    Text("Morning best food")
//                        .font(.system(size: 30).bold())
//                    Spacer()
//                }
//            }
//        }.frame(width: 400)
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(text: .constant(""))
    }
}
