//
//  IssuesListScene.swift
//  QuickGitUI
//
//  Created by Ahmed Fathy on 01/11/2022.
//

import SwiftUI

struct IssuesListScene: View {
    var body: some View {
        List {
            IssueCellView()
            IssueCellView()
            IssueCellView()
            IssueCellView()
        }.navigationTitle("Issues")
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

struct IssuesListScene_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            IssuesListScene()
        }
    }
}
