//
//  Friend.swift
//  FriendsGiving
//
//  Created by app-kaihatsusha on 28/01/2026.
//  Copyright © 2026 app-kaihatsusha. All rights reserved.
//

import Foundation

struct Friend: Identifiable, Codable {
    var id = UUID().uuidString
    
    var name: String
    var bringing: String
    var notes: String
    
    enum CodingKeys: CodingKey {
        case name
        case bringing
        case notes
    }
    
    init(name: String = "", bringing: String = "", notes: String = "") {
        self.name = name
        self.bringing = bringing
        self.notes = notes
    }
}
