//
//  PullRequestsScene.swift
//  QuickGitUI
//
//  Created by Ahmed Fathy on 01/11/2022.
//

import SwiftUI

struct PullRequestsScene: View {
    var body: some View {
        List {
            PullRequestCellView()
            PullRequestCellView()
        }.navigationTitle("Pull Requests")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                Button {
                    print("Search")
                } label: {
                    Image(systemName: "magnifyingglass")
                }
            }
    }
}

struct PullRequestsScene_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PullRequestsScene()
        }
    }
}
