//
//  FriendRow.swift
//  Design#9
//
//  Created by Hubert Le on 1/18/22.
//

import SwiftUI

struct FriendRow: View {
    var friend: Friend
    var body: some View {
        NavigationLink(destination: Text(friend.name)) {
            HStack {
                Image(friend.avatar)
                    .resizable()
                    .renderingMode(.original)
                    .frame(width: 80, height: 80)
                    .cornerRadius(50)
                    .overlay(Circle().stroke(Color.black, lineWidth: 1))
                VStack(alignment: .leading, spacing: 10) {
                    Text(friend.name)
                        .foregroundColor(.primary)
                    Text("\(friend.mutualFriends) mutual friends")
                        .foregroundColor(.secondary)
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

struct FriendRow_Previews: PreviewProvider {
    static var previews: some View {
        FriendRow(friend: Friend(name: "Ashley Bose", mutualFriends: 2, avatar: "fortnite1"))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
