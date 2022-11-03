//
//  RepositoriesListScene.swift
//  QuickGitUI
//
//  Created by Ahmed Fathy on 28/10/2022.
//

import SwiftUI

struct RepositoriesListScene: View {
    var body: some View {
        List {
            NavigationLink {
                RepositorySceneView()
                    .navigationBarTitleDisplayMode(.inline)
            } label: {
                RepositoryCellView()
            }.contextMenu {
                Text("Options")
                    .fontWeight(.bold)
                Button {
                    
                } label: {
                    Image(systemName: "bookmark")
                    Text("Bookmark Repository")
                }
                Button {
                    
                } label: {
                    Image(systemName: "star")
                    Text("Set as favourite Repo")
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "square.and.arrow.up")
                    Text("Share")
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "safari")
                    Text("Open In Safari")
                }
            }
            
            NavigationLink {
                RepositorySceneView()
                    .navigationBarTitleDisplayMode(.inline)
            } label: {
                RepositoryCellView()
            }
        }.navigationTitle("Repositories")
    }
}

struct RepositoriesListScene_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RepositoriesListScene()
        }
    }
}
