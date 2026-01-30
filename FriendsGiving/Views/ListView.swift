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
                    .onDelete { indexSet in
                        friendsVM.deleteFriend(friendIndex: indexSet)
                    }
                    .onMove { oldPostion, newPosition in
                        friendsVM.moveFriend(from: oldPostion, to: newPosition)
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
    
    
//    func playSound(soundName: String) {
//        
//        if audioPlayer != nil && audioPlayer.isPlaying {
//            audioPlayer.stop()
//        }
//        guard let soundFile = NSDataAsset(name: soundName) else {
//            print("😡 Could not read file named \(soundName)")
//            return
//        }
//        
//        do {
//            audioPlayer = try AVAudioPlayer(data: soundFile.data)
//            audioPlayer.play()
//        } catch {
//            print("😡 ERROR: \(error.localizedDescription) creating audioPlayer.")
//        }
//    }
}

#Preview {
    NavigationStack {
        ListView()
            .environment(FriendsViewModel())
    }
}
