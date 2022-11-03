//
//  Users.swift
//  QuickGitUI
//
//  Created by Ahmed Samir on 03/11/2022.
//

import Foundation

// MARK: - Users

struct Users: Codable {
    let totalCount: Int
    let incompleteResults: Bool
    let items: [User]
    
    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }
}
