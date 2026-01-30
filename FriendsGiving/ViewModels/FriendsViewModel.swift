//
//  FriendsViewModel.swift
//  FriendsGiving
//
//  Created by app-kaihatsusha on 28/01/2026.
//  Copyright © 2026 app-kaihatsusha. All rights reserved.
//

import Foundation

@Observable
class FriendsViewModel {
    
    //var friends: [Friend] = []
    
    var friends: [Friend] = [
        Friend(name: "Fred", bringing: "Steak", notes: "Big Meat"),
        Friend(name: "Jill", bringing: "Cheese", notes: "Very Yellow"),
        Friend(name: "John", bringing: "Carrots", notes: "Pointy Vegetable"),
        Friend(name: "Annie", bringing: "Tuna", notes: "Big fish, small fish"),
        Friend(name: "Christopher", bringing: "Balloons", notes: "Always makes a party")
    ]
    
    func saveFriend(friend: Friend) {
        if let index = friends.firstIndex(where: { $0.id == friend.id }) {
            friends[index] = friend
        } else {
            friends.append(friend)
        }
    }
    
    func deleteFriend(friendIndex: IndexSet) {
        friends.remove(atOffsets: friendIndex)
    }
    
    func moveFriend(from: IndexSet, to: Int) {
        friends.move(fromOffsets: from, toOffset: to)
    }
}



