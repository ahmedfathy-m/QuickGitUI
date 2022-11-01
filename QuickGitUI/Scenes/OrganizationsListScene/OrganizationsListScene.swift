//
//  OrganizationsListScene.swift
//  QuickGitUI
//
//  Created by Ahmed Fathy on 02/11/2022.
//

import SwiftUI

struct OrganizationsListScene: View {
    var body: some View {
        List {
            NavigationLink {
                OrganizationScene()
            } label: {
                OrganizationCell()
            }

            NavigationLink {
                OrganizationScene()
            } label: {
                OrganizationCell()
            }
            NavigationLink {
                OrganizationScene()
            } label: {
                OrganizationCell()
            }
        }.navigationTitle("Organizations")
    }
}

struct OrganizationsListScene_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            OrganizationsListScene()
        }
    }
}
