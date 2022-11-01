//
//  UsersSceneView.swift
//  QuickGitUI
//
//  Created by Ahmed Fathy on 28/10/2022.
//

import SwiftUI

struct UsersSceneView: View {
    var body: some View {
        List {
            NavigationLink {
                ProfileSceneView()
                    .navigationBarTitleDisplayMode(.inline)
            } label: {
                UserCellView()
            }
        }
    }
}

struct UsersSceneView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            UsersSceneView()
                .navigationTitle("Users")
        }
    }
}
