//
//  CommitsScene.swift
//  QuickGitUI
//
//  Created by Ahmed Fathy on 01/11/2022.
//

import SwiftUI

struct CommitsScene: View {
    var body: some View {
        List {
            CommitCellView()
            CommitCellView()
            CommitCellView()
        }.navigationTitle("Commits")
            .navigationBarTitleDisplayMode(.large)
    }
}

struct CommitsScene_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CommitsScene()
        }
    }
}
