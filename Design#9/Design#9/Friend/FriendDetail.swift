//
//  FriendDetail.swift
//  Design#9
//
//  Created by Hubert Le on 1/18/22.
//

import SwiftUI

struct FriendDetail: View {
    var friend : Friend
    
    var body: some View {
        VStack {
            Image(friend.banner)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200, alignment: .center)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding([.leading, .trailing])
            VStack {
                Image(friend.avatar)
                    .resizable()
                    .clipped()
                    .clipShape(Circle())
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120, height: 120)
                Text(friend.name)
                    .fontWeight(.bold)
            }.offset(y: -70)
            HStack {
                Text("Most ordered drink")
                    .font(.system(size: 25).bold())
                Spacer()
            }
            HStack {
                Image(friend.drinks)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                .cornerRadius(20)
                .padding()
                Spacer()
                Text(friend.drinkName)
                    .font(.system(size: 20).bold())
                Spacer()
            }.frame(width: 400, height: 120)
                .background(Color(#colorLiteral(red: 0.9762765765, green: 0.9762766957, blue: 0.9762765765, alpha: 1)))
                .cornerRadius(30)
            Spacer()
        }.navigationBarBackButtonHidden(false)
        .navigationBarTitle(Text(friend.name), displayMode: .inline)
        .frame(width: 400)
    }
}

struct FriendDetail_Previews: PreviewProvider {
    static var previews: some View {
        FriendDetail(friend: Friend(name: "Ashley Bose", mutualFriends: 2, avatar: "fortnite1", banner: "fortniteBack1", drinks: "coffeecup1", drinkName: "Vietnamese Coffee"))
    }
}
