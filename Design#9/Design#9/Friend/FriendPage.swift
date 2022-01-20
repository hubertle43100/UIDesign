//
//  FriendPage.swift
//  Design#9
//
//  Created by Hubert Le on 1/18/22.
//

import SwiftUI

struct Friend: Identifiable {
    var id: UUID = UUID()
    var name: String
    var mutualFriends: Int
    var avatar: String
    var banner: String
    var drinks: String
    var drinkName: String
}

struct FriendPage: View {
    
    var friends:[Friend] = [
        Friend(name: "Ashley Bose", mutualFriends: 2, avatar: "fortnite1", banner: "coffeeshop1", drinks: "coffeecup1", drinkName: "Vietnamese Coffee"),
    Friend(name: "Kaitlin Sanders", mutualFriends: 0, avatar: "fortnite2", banner: "coffeeshop2", drinks: "matcha", drinkName: "Matcha"),
    Friend(name: "Chantelle Nguyen", mutualFriends: 1, avatar: "fortnite3", banner: "coffeeshop3", drinks: "coffeecup2", drinkName: "Strawberry Frappicino"),
    Friend(name: "Joel Robinson", mutualFriends: 5, avatar: "fortnite4", banner: "coffeeshop4", drinks: "latte", drinkName: "Latte"),
    Friend(name: "Katy Li", mutualFriends: 6, avatar: "fortnite5", banner: "coffeeshop5", drinks: "coffeecup5", drinkName: "Iced Latte")
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(friends, id: \.id) { friend in
                    FriendRow(friend: friend).padding()
                }.navigationBarTitle("Friends")
            }
        }
    }
}

struct FriendPage_Previews: PreviewProvider {
    static var previews: some View {
        FriendPage()
    }
}

struct FriendRow: View {
    var friend: Friend
    var body: some View {
        NavigationLink(destination: FriendDetail(friend: friend)) {
            HStack {
                Image(friend.avatar)
                    .resizable()
                    .renderingMode(.original)
                    .frame(width: 80, height: 80)
                    .cornerRadius(50)
                    .overlay(Circle().stroke(Color.black, lineWidth: 1))
                VStack(alignment: .leading, spacing: 10) {
                    VStack(alignment: .leading, spacing: 2) {
                        Text(friend.name)
                            .foregroundColor(.primary)
                        Text("\(friend.mutualFriends) mutual friends")
                            .foregroundColor(.secondary)
                    }
                    HStack {
                        Button(action: {
                            print("Add friend")
                        }) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 5)
                                    .frame(height: 35)
                                    .foregroundColor(Color(#colorLiteral(red: 0.08072049171, green: 0.3028114438, blue: 0.1690582633, alpha: 1)))
                                Text("Add Friend")
                            }
                        }
                        Button(action: {
                            print("Add friend")
                        }) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 5)
                                    .frame(height: 35)
                                    .foregroundColor(Color(#colorLiteral(red: 0.7387881875, green: 0.5716782212, blue: 0.3622662723, alpha: 1)))
                                Text("Coffee Invite")
                            }
                        }
                        Spacer()
                    }
                }
            }
        }
    }
}
