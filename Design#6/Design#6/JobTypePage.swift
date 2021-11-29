//
//  JobTypePage.swift
//  Design#6
//
//  Created by Hubert Le on 11/26/21.
//

import SwiftUI

struct JobTypePage: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

        var body: some View {
            VStack {
                HeaderJob()
            }
        }
}

struct JobTypePage_Previews: PreviewProvider {
    static var previews: some View {
        JobTypePage()
    }
}

struct HeaderJob: View {
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "arrow.backward")
                            .font(.system(size: 25))
                            .foregroundColor(Color.black)
                    }
                }.navigationBarTitle("")
                    .padding(.trailing,115)
                Text("Option")
                    .font(.system(size: 20).bold())
                Spacer()
            }.frame(width:370)
                .padding(.bottom,50)
            HStack {
                Text("Choose")
                    .font(.system(size: 40).bold())
                Text("Job Type")
                    .font(.system(size: 40).bold())
                    .foregroundColor(Color(#colorLiteral(red: 0.8674479127, green: 0.6583648324, blue: 0.6540154219, alpha: 1)))
            }.padding(.bottom)
            VStack {
                Text("Are you looking for a new job or looking for new employee?")
                    .font(.system(size: 19))
                    .lineLimit(2)
                    .lineSpacing(5)
                    .multilineTextAlignment(.center)
                    .opacity(0.6)
            }.frame(width: 290)
        }
    }
}
