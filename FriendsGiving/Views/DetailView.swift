//
//  DetailView.swift
//  FriendsGiving
//
//  Created by app-kaihatsusha on 28/01/2026.
//  Copyright © 2026 app-kaihatsusha. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(FriendsViewModel.self) private var friendsVM
    
    @State var friend: Friend

    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Name:")
                .bold()
            TextField("name", text: $friend.name)
                .textFieldStyle(.roundedBorder)
                .autocorrectionDisabled()
                .padding(.bottom)
            Text("Bringing:")
                .bold()
            TextField("bringing", text: $friend.bringing)
                .textFieldStyle(.roundedBorder)
                .autocorrectionDisabled()
                .padding(.bottom)
            Text("Notes:")
                .bold()
            TextField("notes", text: $friend.notes)
                .textFieldStyle(.roundedBorder)
                .autocorrectionDisabled()
                .padding(.bottom)
            Spacer()
        }
        .padding()
        .navigationBarBackButtonHidden()
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .confirmationAction) {
                Button("Save") {
                    
                    friendsVM.saveFriend(friend: friend)
                    
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        DetailView(friend: Friend(name: "Fred", bringing: "Steak", notes: "Lots of meat"))
            .environment(FriendsViewModel())
           
    }
}
