//
//  HomeViewModel.swift
//  QuickGitUI
//
//  Created by Ahmed Fathy on 25/10/2022.
//

import SwiftUI

enum HomeMenu: Int, CaseIterable {
    case users
    case repositories
    case issues
    case organizations
    
    var title: String {
        switch self {
            case .users: return "Users"
            case .repositories: return "Repositories"
            case .issues: return "Issues"
        case .organizations: return "Organizations"
        }
    }
    
    var image: String {
        switch self {
            case .users: return "person"
            case .repositories: return "book.closed"
            case .issues: return "exclamationmark.circle"
        case . organizations: return "building.2"
        }
    }
    
    var color: Color {
        switch self {
        case .users: return .gray
        case .repositories: return .blue
        case .issues: return .green
        case .organizations: return .orange
        }
    }
}
