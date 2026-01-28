//
//  ListView.swift
//  FriendsGiving
//
//  Created by app-kaihatsusha on 28/01/2026.
//  Copyright © 2026 app-kaihatsusha. All rights reserved.
//

import SwiftUI

struct ListView: View {
    
    @Environment(FriendsViewModel.self) private var friendsVM
    
    var body: some View {
        VStack {
            Text("Friends Giving")
            
        }
       
    }
}

#Preview {
    ListView()
        .environment(FriendsViewModel())
}
