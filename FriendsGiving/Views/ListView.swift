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
    
    @State private var isSheetPresented = false
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(friendsVM.friends) { friend in
                        NavigationLink {
                            DetailView(friend: friend)
                                .environment(friendsVM)
                        } label: {
                            VStack(alignment: .leading) {
                                Text(friend.name)
                                    .font(.title2)
                                Text(friend.bringing)
                                    .font(.callout)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
                .listStyle(.plain)
                
            }
            .navigationTitle("Friends")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("", systemImage: "plus") {
                        isSheetPresented.toggle()
                    }
                }
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
            }

        }
        .sheet(isPresented: $isSheetPresented) {
            NavigationStack {
                DetailView(friend: Friend())
            }
        }
        
    }
}

#Preview {
    NavigationStack {
        ListView()
            .environment(FriendsViewModel())
    }
}
