//
//  FriendsGivingApp.swift
//  FriendsGiving
//
//  Created by app-kaihatsusha on 28/01/2026.
//  Copyright © 2026 app-kaihatsusha. All rights reserved.
//

import SwiftUI

@main
struct FriendsGivingApp: App {
    
    @State private var friendsVM = FriendsViewModel()
    
    var body: some Scene {
        WindowGroup {
            ListView()
                .environment(friendsVM)
                .onAppear {
                    Thread.sleep(forTimeInterval: 3)
                }
        }
    }
}
