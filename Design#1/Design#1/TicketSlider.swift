//
//  Ticket Slider.swift
//  Design#1
//
//  Created by Hubert Le on 11/8/21.
//

import SwiftUI

struct TicketSlider: View {
    let ticketPrices = ["$104", "$128/day", "$110/day", "$90/day", "$76/day"]
    var body: some View {
        VStack (spacing: 20){
            HStack {
                ReturnButton()
                Spacer()
            }
            ScrollView (.horizontal, showsIndicators: false) {
                HStack {
                        VStack(alignment: .leading) {
                            Image(systemName: "bag")
                                .padding(.bottom)
                            Text("No Ticket Added")
                            Text("\(ticketPrices[0])")
                                .font(.system(size: 19, weight: .bold, design: .default))
                                .padding(.top, 1)
                        }
                        .frame(width: 150, height: 150)
                        .background(Color(#colorLiteral(red: 0.9322997928, green: 0.790276587, blue: 0.8465473652, alpha: 1)))
                        .foregroundColor(.white)
                        .cornerRadius(20)
                    VStack(alignment: .leading) {
                        Image(systemName: "bag")
                            .padding(.bottom)
                        Text("No Ticket Added")
                        Text("\(ticketPrices[1])")
                            .font(.system(size: 19, weight: .bold, design: .default))
                            .padding(.top, 1)
                    }
                    .frame(width: 150, height: 150)
                    .background(Color(#colorLiteral(red: 0.9322997928, green: 0.790276587, blue: 0.8465473652, alpha: 1)))
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    VStack(alignment: .leading) {
                        Image(systemName: "bag")
                            .padding(.bottom)
                        Text("No Ticket Added")
                        Text("\(ticketPrices[2])")
                            .font(.system(size: 19, weight: .bold, design: .default))
                            .padding(.top, 1)
                    }
                    .frame(width: 150, height: 150)
                    .background(Color(#colorLiteral(red: 0.9322997928, green: 0.790276587, blue: 0.8465473652, alpha: 1)))
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    VStack(alignment: .leading) {
                        Image(systemName: "bag")
                            .padding(.bottom)
                        Text("No Ticket Added")
                        Text("\(ticketPrices[3])")
                            .font(.system(size: 19, weight: .bold, design: .default))
                            .padding(.top, 1)
                    }
                    .frame(width: 150, height: 150)
                    .background(Color(#colorLiteral(red: 0.9322997928, green: 0.790276587, blue: 0.8465473652, alpha: 1)))
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    VStack(alignment: .leading) {
                        Image(systemName: "bag")
                            .padding(.bottom)
                        Text("No Ticket Added")
                        Text("\(ticketPrices[4])")
                            .font(.system(size: 19, weight: .bold, design: .default))
                            .padding(.top, 1)
                    }
                    .frame(width: 150, height: 150)
                    .background(Color(#colorLiteral(red: 0.9322997928, green: 0.790276587, blue: 0.8465473652, alpha: 1)))
                    .foregroundColor(.white)
                    .cornerRadius(20)
                        }
                    }
            HStack {
                OutboundBtn()
                    .padding(.leading, 0)
                Spacer()
            }
            ScrollView (.horizontal, showsIndicators: false) {
                HStack {
                        VStack(alignment: .leading) {
                            Image(systemName: "bag")
                                .padding(.bottom)
                            Text("No Ticket Added")
                            Text("\(ticketPrices[0])")
                                .font(.system(size: 19, weight: .bold, design: .default))
                                .padding(.top, 1)
                        }
                        .frame(width: 150, height: 150)
                        .background(Color(#colorLiteral(red: 0.9322997928, green: 0.790276587, blue: 0.8465473652, alpha: 1)))
                        .foregroundColor(.white)
                        .cornerRadius(20)
                    VStack(alignment: .leading) {
                        Image(systemName: "bag")
                            .padding(.bottom)
                        Text("No Ticket Added")
                        Text("\(ticketPrices[1])")
                            .font(.system(size: 19, weight: .bold, design: .default))
                            .padding(.top, 1)
                    }
                    .frame(width: 150, height: 150)
                    .background(Color(#colorLiteral(red: 0.9322997928, green: 0.790276587, blue: 0.8465473652, alpha: 1)))
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    VStack(alignment: .leading) {
                        Image(systemName: "bag")
                            .padding(.bottom)
                        Text("No Ticket Added")
                        Text("\(ticketPrices[2])")
                            .font(.system(size: 19, weight: .bold, design: .default))
                            .padding(.top, 1)
                    }
                    .frame(width: 150, height: 150)
                    .background(Color(#colorLiteral(red: 0.9322997928, green: 0.790276587, blue: 0.8465473652, alpha: 1)))
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    VStack(alignment: .leading) {
                        Image(systemName: "bag")
                            .padding(.bottom)
                        Text("No Ticket Added")
                        Text("\(ticketPrices[3])")
                            .font(.system(size: 19, weight: .bold, design: .default))
                            .padding(.top, 1)
                    }
                    .frame(width: 150, height: 150)
                    .background(Color(#colorLiteral(red: 0.9322997928, green: 0.790276587, blue: 0.8465473652, alpha: 1)))
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    VStack(alignment: .leading) {
                        Image(systemName: "bag")
                            .padding(.bottom)
                        Text("No Ticket Added")
                        Text("\(ticketPrices[4])")
                            .font(.system(size: 19, weight: .bold, design: .default))
                            .padding(.top, 1)
                    }
                    .frame(width: 150, height: 150)
                    .background(Color(#colorLiteral(red: 0.9322997928, green: 0.790276587, blue: 0.8465473652, alpha: 1)))
                    .foregroundColor(.white)
                    .cornerRadius(20)
                        }
                    }
                }
                .padding(.leading, 30)
            }
        }

struct TicketSlider_Previews: PreviewProvider {
    static var previews: some View {
        TicketSlider()
    }
}

struct OutboundBtn: View {
    var body: some View {
        HStack {
            Image(systemName: "arrowshape.turn.up.left")
                .rotationEffect(Angle(degrees: 180))
                .frame(width: 30, height: 30)
                
                .background(Color(#colorLiteral(red: 0.2272113562, green: 0.4730796814, blue: 0.7378985286, alpha: 1)))
                .foregroundColor(.white)
                .cornerRadius(15)
            Text("Return")
                .bold()
                .foregroundColor(Color(#colorLiteral(red: 0.2272113562, green: 0.4730796814, blue: 0.7378985286, alpha: 1)))
                .padding(.trailing, 30)
        }
        .frame(width: 180, height: 44)
        .background(Color(#colorLiteral(red: 0.7166799903, green: 0.894115746, blue: 0.9685603976, alpha: 1)))
        .cornerRadius(20)
    }
}


struct ReturnButton: View {
    var body: some View {
        HStack {
            Image(systemName: "arrowshape.turn.up.left")
                .rotationEffect(Angle(degrees: 180))
                .frame(width: 30, height: 30)
                
                .background(Color(#colorLiteral(red: 0.2272113562, green: 0.4730796814, blue: 0.7378985286, alpha: 1)))
                .foregroundColor(.white)
                .cornerRadius(15)
            Text("Outbound")
                .bold()
                .foregroundColor(Color(#colorLiteral(red: 0.2272113562, green: 0.4730796814, blue: 0.7378985286, alpha: 1)))
                .padding(.trailing, 30)
        }
        .frame(width: 180, height: 44)
        .background(Color(#colorLiteral(red: 0.7166799903, green: 0.894115746, blue: 0.9685603976, alpha: 1)))
        .cornerRadius(20)
        .padding(.leading, 0)
    }
}
