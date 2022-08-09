//
//  IntroPage.swift
//  Design#6
//
//  Created by Hubert Le on 11/25/21.
//

import SwiftUI

struct IntroPage: View {
    var body: some View {
        ZStack {
            PhillipPic()
            PhillipWords()
            CompanyDescription()
        }
    }
}

struct IntroPage_Previews: PreviewProvider {
    static var previews: some View {
        IntroPage()
    }
}

struct PhillipPic: View {
    var body: some View {
        ZStack {
            VStack {
                Image("blob_color")
                    .resizable()
                    .frame(width: 410, height: 410)
                    .opacity(0.5)
                Spacer()
            }
            VStack {
                Image("phillip_martin")
                    .resizable()
                    .frame(width: 400, height: 530.0)
                    .offset(x: 0, y: -90)
                Spacer()
            }
            Image("pink_blob")
                .resizable()
                .offset(x: 10, y: 80)
                .frame(width: 350, height: 350)
                .foregroundColor(Color(#colorLiteral(red: 0.9698035121, green: 0.9402344823, blue: 0.9103677869, alpha: 1)))
            HStack {
                Circle()
                    .frame(width: 160, height: 160)
                    .foregroundColor(Color(#colorLiteral(red: 0.9554244876, green: 0.565690577, blue: 0.3988157809, alpha: 1)))
                    .opacity(0.6)
                Spacer()
            }
            HStack {
                Circle()
                    .offset(x: 5, y: 0)
                    .frame(width: 150, height: 150)
                    .foregroundColor(Color.white)
                Spacer()
            }
            
            HStack {
                Spacer()
                VStack {
                    Circle()
                        .offset(x: -20, y: 50)
                        .frame(width: 130, height: 130)
                        .foregroundColor(Color(#colorLiteral(red: 0.9081580043, green: 0.8245491982, blue: 0.7956882715, alpha: 1)))
                    Spacer()
                }
            }
            HStack {
                Spacer()
                VStack {
                    Circle()
                        .offset(x: -25, y: 55)
                        .frame(width: 120, height: 120)
                        .foregroundColor(Color.white)
                    Spacer()
                }
            }
        }
    }
}

struct PhillipWords: View {
    var body: some View {
        ZStack {
            VStack {
                Text("Job Offers")
                    .font(.system(size: 18))
                    .opacity(0.6)
                    .offset(x: 125, y: 115)
                Spacer()
            }
            HStack {
                Text("70K+")
                    .font(.system(size: 25,weight: .heavy))
                    .offset(x: 50, y: -20)
                Spacer()
            }
            HStack {
                Text("Recruiters")
                    .font(.system(size: 20))
                    .opacity(0.6)
                    .offset(x: 35, y: 10)
                Spacer()
            }
            VStack {
                Text("1K+")
                    .font(.system(size: 25,weight: .heavy))
                    .offset(x: 125, y: 80)
                Spacer()
            }
        }
    }
}

struct CompanyDescription: View {
    var body: some View {
        VStack {
            Text("Everything you need in one app")
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .frame(width: 350, height: 120, alignment: .center)
                .font(.system(size: 30).bold())
                .offset(x: 0, y: 295)
            Text("Create your profile now and be visible to the top recruiters in the world")
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .frame(width: 350, height: 120, alignment: .center)
                .offset(x: 0, y: 245)
        }
    }
}
