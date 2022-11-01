//
//  Navigator.swift
//  QuickGitUI
//
//  Created by Ahmed Fathy on 28/10/2022.
//

import SwiftUI

enum Route: String {
    case settings
    case issues
    case repositories
    case users
    case organizations
}

struct Navigator {
    static func navigateTo<T: View>(_ route: Route, content: () -> T) -> AnyView {
        switch route {
        case .settings:
            return AnyView(NavigationLink(destination: Text("Settings"), label: content))
        case .issues:
            return AnyView(NavigationLink(destination: IssuesListScene(), label: content))
        case .repositories:
            return AnyView(NavigationLink(destination: RepositoriesListScene(), label: content))
        case .users:
            return AnyView(NavigationLink(destination: UsersSceneView().navigationTitle("Users"), label: content))
        case .organizations:
            return AnyView(NavigationLink(destination: OrganizationsListScene(), label: content))
        }
    }
}
