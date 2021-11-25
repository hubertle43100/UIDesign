//
//  ContentView.swift
//  Design#5
//
//  Created by Hubert Le on 11/23/21.
//

import SwiftUI

struct ContentView: View {
    @State private var currentStep = 0
    
    init() {
        UIScrollView.appearance().bounces = false
    }
    
    var body: some View {
        
        VStack {
            TabView(selection: $currentStep) {
                ForEach(0..<onBoardingSteps.count) { it in
                    VStack {
                        VStack {
                            Image(onBoardingSteps[it].image)
                                .resizable()
                                .frame(width: 350, height: 350)
                        }.frame(width: 440, height: 500)
                        ZStack {
                            VStack {
                                    VStack {
                                        Spacer()
                                        HStack {
                                            Text(onBoardingSteps[it].title)
                                                .lineLimit(2)
                                                .font(.system(size: 23).bold())
                                                .padding(.top, 20)
                                            Spacer()
                                        }.frame(width: 350, height: 90)
                                        HStack {
                                            Text(onBoardingSteps[it].description)
                                                .opacity(0.6)
                                                .lineLimit(4)
                                                .font(.system(size: 16))
                                        }.frame(width: 350, height: 80)
                                            .padding(.bottom, 30)
                                        HStack{
                                            ForEach(0..<onBoardingSteps.count) { it in
                                                if it == currentStep {
                                                    Rectangle()
                                                        .frame(width: 20, height: 10)
                                                        .cornerRadius(10)
                                                        .foregroundColor(.blue)
                                                } else {
                                                    Circle()
                                                        .frame(width: 10, height: 10)
                                                        .foregroundColor(.gray)
                                                }
                                            }
                                        }.padding(.bottom, 24)
                                        Button(action: {
                                            if self.currentStep < onBoardingSteps.count - 1 {
                                                self.currentStep += 1
                                            } else {
                                                
                                            }
                                        }) {
                                            Text(currentStep < onBoardingSteps.count - 1 ? "Next" : "Get started")
                                                .padding(16)
                                                .frame(maxWidth: .infinity)
                                                .background(Color.blue)
                                                .cornerRadius(16)
                                                .padding(.horizontal, 16)
                                                .foregroundColor(.white)
                                                .padding(.bottom, 20)
                                        }.buttonStyle(PlainButtonStyle())
                                    }.background(Color.white)
                                    .cornerRadius(50)
                                
                            }
                        }
                    } .tag(it)
                    
                }
            }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }.background(Color.red)
            .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct OnBoardingStep {
    let image: String
    let title: String
    let description: String
}

private let onBoardingSteps = [
    OnBoardingStep(image: "bento", title: "Want high quality prepped meals?", description: "Best cheap meal to be right at your doorstep so you don't spend time going out buying expensive take home."),
    OnBoardingStep(image: "scooter", title: "Delivery in three days or less?", description: "We bring your food quick to get your meal ready for the week whether its lunch for afternoon breaks or a quick dinner for the most minimal cooking"),
    OnBoardingStep(image: "delivery-courier", title: "Contactless delivery with every order?", description: "Yes, we are very safe with all orders that we bring to each doorstep. We will drop off the package with a photo to make sure you get your order.")
]
