//
//  RepositorySceneView.swift
//  QuickGitUI
//
//  Created by Ahmed Fathy on 28/10/2022.
//

import SwiftUI

struct RepositorySceneView: View {
    var body: some View {
        VStack {
            // MARK: - Header
            VStack (alignment: .leading, spacing: 5) {
                Text("Repository Name")
                    .font(.system(size: 26))
                    .fontWeight(.bold)
                
                NavigationLink {
                    ProfileSceneView()
                } label: {
                    HStack {
                        Text("by")
                            .foregroundColor(.gray)
                        Image(systemName: "person.fill")
                            .background(Color.green)
                            .foregroundColor(.gray)
                            .clipShape(Circle())
                        Text("Some dev name")
                            .foregroundColor(.gray)
                    }
                }

                HStack {
                    Image(systemName: "star")
                        .foregroundColor(.gray)
                    Text("5")
                    Text("stars")
                        .foregroundColor(.gray)
                    Image(systemName: "tuningfork")
                        .foregroundColor(.gray)
                    Text("0")
                    Text("forks")
                        .foregroundColor(.gray)
                }
                
                HStack {
                    Button {
                        print("starred")
                    } label: {
                        HStack {
                            Image(systemName: "star")
                            Text("Star")
                                .frame(maxWidth: .infinity)
                        }
                    }.buttonStyle(.borderedProminent)
                        .tint(.gray.opacity(0.5))
                        .foregroundColor(.gray)
                    
                    Button {
                        print("notification")
                    } label: {
                        Image(systemName: "bell.fill")
                    }.buttonStyle(.borderedProminent)
                        .tint(.gray.opacity(0.5))
                        .foregroundColor(.blue)
                }
            }.padding()
            .background(Color.gray.opacity(0.2))
            
            // MARK: - Action List
            List {
                NavigationLink {
                    IssuesListScene()
                } label: {
                    ActionCellView(itemTitle: "Issues", iconColor: .green, isCounting: true, itemIcon: Image(systemName: "smallcircle.filled.circle"))
                }
                
                NavigationLink {
                    PullRequestsScene()
                } label: {
                    ActionCellView(itemTitle: "Pull Requests", iconColor: .blue, isCounting: true, itemIcon: Image(systemName: "arrow.triangle.pull"))
                }

                NavigationLink {
                    UsersSceneView()
                        .navigationBarTitleDisplayMode(.large)
                        .navigationTitle("Contributors")
                } label: {
                    ActionCellView(itemTitle: "Contributors", iconColor: .orange, isCounting: true, itemIcon: Image(systemName: "person.2"))
                }
                
                NavigationLink {
                    UsersSceneView()
                        .navigationBarTitleDisplayMode(.large)
                        .navigationTitle("Watchers")
                } label: {
                    ActionCellView(itemTitle: "Watchers", iconColor: .yellow, isCounting: true, itemIcon: Image(systemName: "eye"))
                }

                ActionCellView(itemTitle: "Browse Code", iconColor: .gray, isCounting: false, itemIcon: Image(systemName: "chevron.left.forwardslash.chevron.right"))
                
                NavigationLink {
                    CommitsScene()
                } label: {
                    ActionCellView(itemTitle: "Commits", iconColor: .gray, isCounting: false, itemIcon: Image(systemName: "circle.and.line.horizontal.fill"))
                }

            }.listStyle(.plain)
        }.toolbar {
                Button {
                    print("Create Issue")
                } label: {
                    Image(systemName: "plus.circle")
                }
                
                Button {
                    print("Share")
                } label: {
                    Image(systemName: "square.and.arrow.up")
                }
        }
        
    }
}

struct RepositorySceneView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RepositorySceneView()
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}
