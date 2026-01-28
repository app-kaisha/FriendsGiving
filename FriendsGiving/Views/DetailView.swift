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
    
    @State var friend: Friend

    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Name:")
                .bold()
            TextField("name", text: $friend.name)
                .textFieldStyle(.roundedBorder)
                .padding(.bottom)
            Text("Bringing:")
                .bold()
            TextField("bringing", text: $friend.bringing)
                .textFieldStyle(.roundedBorder)
                .padding(.bottom)
            Text("Notes:")
                .bold()
            TextField("notes", text: $friend.notes)
                .textFieldStyle(.roundedBorder)
                .padding(.bottom)
            Spacer()
        }
        .padding()
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .confirmationAction) {
                Button("Save") {
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        DetailView(friend: Friend(name: "Fred", bringing: "Steak", notes: "Lots of meat"))
    }
}
