//
//  ChooseOptions.swift
//  Design#6
//
//  Created by Hubert Le on 11/26/21.
//

import SwiftUI

struct ChooseOptions: View {
    @State private var didTap: Bool = false
    @State private var didnTap: Bool = false
    var body: some View {
        
        VStack {
            HStack {
                Button(action: {
                    self.didTap = false
                    self.didnTap = true
                }) {
                    Option(image: "briefcase.fill", optionTitle: "Find a job", description: "It's easy to find your dream jobs here with us.", colorHighlight: Color(#colorLiteral(red: 0.8674479127, green: 0.6583648324, blue: 0.6540154219, alpha: 1)), optionClicked: didnTap ? Color.green : Color.white)
                        .padding(.trailing)
                }
                Button(action: {
                    self.didTap = true
                    self.didnTap = false
                }) {
                    Option(image: "person.fill", optionTitle: "Find Employee", description: "It's easy to find your employees here with us.", colorHighlight: Color(#colorLiteral(red: 0.9318377376, green: 0.9446975589, blue: 0.9674580693, alpha: 1)), optionClicked: didTap ? Color.red : Color.white)
                }
            }
            Button(action: {
                    self.didTap = true
                }) {

                Text("My custom button")
                    .font(.system(size: 24))
                }
                .frame(width: 300, height: 75, alignment: .center)
                .padding(.all, 20)
                .background(didTap ? Color.blue : Color.yellow)
        }
    }
}

struct ChooseOptions_Previews: PreviewProvider {
    static var previews: some View {
        ChooseOptions()
    }
}

struct Option: View {
    var image: String
    var optionTitle: String
    var description: String
    var colorHighlight: Color
    var optionClicked: Color
    
    var body: some View {
        VStack {
            VStack {
                VStack {
                    Image(systemName: image)
                        .font(.system(size: 30))
                        .foregroundColor(optionClicked)
                }.frame(width: 80, height: 80)
                    .background(colorHighlight)
                    .cornerRadius(100)
                    .padding(.bottom)
                Text(optionTitle)
                    .font(.system(size: 19).bold())
                    .padding(.bottom,1)
                    .foregroundColor(.black)
                Text(description)
                    .lineLimit(3)
                    .foregroundColor(.black)
                    .frame(width: 150, height: 80)
                    .multilineTextAlignment(.center)
            }.frame(width: 160, height: 240)
                .background(Color(#colorLiteral(red: 0.9582590461, green: 0.9727497697, blue: 0.9765676856, alpha: 1)))
                .cornerRadius(20)
        }.frame(width: 165, height: 245)
            .background(colorHighlight)
            .cornerRadius(20)
    }
}

struct MyButtonStyle: ButtonStyle {

  func makeBody(configuration: Self.Configuration) -> some View {
    configuration.label
      .padding()
      .foregroundColor(.white)
      .background(configuration.isPressed ? Color.red : Color.blue)
      .cornerRadius(8.0)
  }

}
