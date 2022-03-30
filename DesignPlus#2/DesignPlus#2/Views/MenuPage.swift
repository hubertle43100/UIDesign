//
//  MenuPage.swift
//  DesignPlus#2
//
//  Created by Hubert Le on 2/28/22.
//

import SwiftUI
import URLImage

struct MenuPage: View {
    @State var selected = 0
    let date = Date()
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Circle()
                        .frame(width: 20, height: 20)
                    Text("Bulletin News")
                    Spacer()
                    
                }.padding(.bottom, 20)
                HStack {
                    Text(date, style: .date)
                    Spacer()
                }
                HStack {
                    Text("Welcome back,\nJeniffer")
                        .font(.system(size: 40).bold())
                    Spacer()
                }
                GeometryReader{_ in
                    SegmentedControl(selected: $selected)
                    if self.selected == 0 {
                        Feeds(article: Article.dummyData)
                    }
                    else {
                        Popular()
                    }
                }
            }.padding()
        }
    }
}

struct MenuPage_Previews: PreviewProvider {
    static var previews: some View {
        MenuPage()
    }
}
struct SegmentedControl : View {
    
    @Binding var selected : Int
    
    var body : some View {
        HStack {
            Button(action: {
                self.selected = 0
            }) {
                Text("Feeds").frame(width: 190, height: 30)
                    .background(self.selected == 0 ? .white : Color(#colorLiteral(red: 0.9490196109, green: 0.9490197301, blue: 0.9490196109, alpha: 1)))
                    .clipShape(Capsule())
            }.foregroundColor(.black)
            Button(action: {
                self.selected = 1
            }) {
                Text("Popular").frame(width: 190, height: 30)
                    .background(self.selected == 1 ? .white : Color(#colorLiteral(red: 0.9490196109, green: 0.9490197301, blue: 0.9490196109, alpha: 1)))
                    .clipShape(Capsule())
            }.foregroundColor(.black)
        }.padding(8).background(Color(#colorLiteral(red: 0.9490196109, green: 0.9490197301, blue: 0.9490196109, alpha: 1)))
            .clipShape(Capsule())
    }
}
struct Feeds : View {
    
    let article: Article
    
    var body : some View {
        
        ScrollView(.vertical, showsIndicators: false){
            HStack {
                if let imgURL = article.image,
                   let url = URL(string: imgURL) {
                    URLImage(url) {
                        // This view is displayed before download starts
                        EmptyView()
                    } inProgress: { progress in
                        // Display progress
                        Text("Loading...")
                    } failure: { error, retry in
                        // Display error and retry button
                        PlaceholderImageView()
                    } content: { image in
                        // Downloaded image
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    }.frame(width: 100, height: 100)
                        .cornerRadius(10)
                } else {
                    PlaceholderImageView()
                }
                VStack(alignment: .leading, spacing: 4) {
                    Text(article.title ?? "")
                        .foregroundColor(.black)
                        .font(.system(size: 18, weight: .semibold))
                    Text(article.source ?? "")
                        .foregroundColor(.gray)
                        .font(.footnote)
                }
            }
        }.offset(y: 70)
    }
}
struct PlaceholderImageView: View {
    var body: some View {
        Image(systemName: "photo.fill")
            .foregroundColor(.white)
            .background(Color.gray)
            .frame(width: 100, height: 100)
    }
}

struct Popular : View {
    var body : some View {
        ScrollView(.vertical, showsIndicators: false){
            HStack {
               Text("Just received our 2 new matching sofas. They were delivered on time by a very courteous and professional team. They are extremely nice…even nicer than we hoped! A sight unseen internet purchase was quite an anxious event as you can imagine and we could not be happier!! Highly recommend Article to anyone who might be considering purchasing from them. ")
            }
        }.offset(y: 70)
    }
}
