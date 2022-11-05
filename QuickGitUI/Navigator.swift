//
//  Navigator.swift
//  QuickGitUI
//
//  Created by Ahmed Fathy on 28/10/2022.
//

import SwiftUI

enum ViewRouter {
    // MARK: - MAIN PAGES
    case allUsers
    case allRepositories
    case allIssues
    case allOrgs
}

extension ViewRouter {
    func instantiateView () -> AnyView {
        switch self {
            case .allUsers: return AnyView(UsersSceneView().navigationTitle("Users"))
            case .allRepositories: return AnyView(RepositoriesListScene())
            case .allIssues: return AnyView(IssuesListScene())
            case .allOrgs: return AnyView(OrganizationsListScene())
        }
    }
}
