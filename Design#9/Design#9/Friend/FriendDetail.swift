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
            Spacer()
        }
    }
}

struct FriendDetail_Previews: PreviewProvider {
    static var previews: some View {
        FriendDetail(friend: Friend(name: "Ashley Bose", mutualFriends: 2, avatar: "fortnite1", banner: "fortniteBack1"))
    }
}
