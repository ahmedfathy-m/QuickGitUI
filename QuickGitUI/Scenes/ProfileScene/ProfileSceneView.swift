//
//  ProfileSceneView.swift
//  QuickGitUI
//
//  Created by Ahmed Fathy on 28/10/2022.
//

import SwiftUI

struct ProfileSceneView: View {
    var body: some View {
        VStack {
            // MARK: - Header
            VStack (alignment: .leading) {
                HStack {
                    Image(systemName: "person.fill")
                        .imageScale(.large)
                        .frame(width: 70, height: 70, alignment: .center)
                        .background(Color.green)
                        .clipShape(Circle())
                    VStack(alignment: .leading) {
                        Text("Ahmed Fathy")
                            .font(.title)
                            .fontWeight(.bold)
                        Text("ahmedfathy-m")
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
                Text("Junior iOS Developer")
                    .padding(.bottom, 5)
//                HStack {
//                    Image(systemName: "person")
//                    Button("**1** follower") {
//                        print("Followers")
//                    }.buttonStyle(.plain)
//                    Image(systemName: "circle.fill")
//                        .scaleEffect(x: 0.4, y: 0.4, anchor: .center)
//                    Button("**8** following") {
//                        print("Followers")
//                    }.buttonStyle(.plain)
//                }
                
                HStack {
                    Image(systemName: "person")
                    NavigationLink {
                        UsersSceneView()
                            .navigationTitle("Followers")
                            .navigationBarTitleDisplayMode(.large)
                    } label: {
                        Text("**1** follower")
                    }.buttonStyle(.plain)
                    Image(systemName: "circle.fill")
                        .scaleEffect(x: 0.4, y: 0.4, anchor: .center)
                    NavigationLink {
                        UsersSceneView()
                            .navigationTitle("Following")
                            .navigationBarTitleDisplayMode(.large)
                    } label: {
                        Text("**8** following")
                    }.buttonStyle(.plain)

                }
            }.padding()
                .background(Color.gray.opacity(0.2))
            
            // MARK: - List
            List {
                NavigationLink {
                    RepositoriesListScene()
                        .navigationBarTitleDisplayMode(.large)
                } label: {
                    ActionCellView(itemTitle: "Repositories", iconColor: .black, isCounting: true, itemIcon: Image(systemName: "book.closed"))
                }

                NavigationLink {
                    OrganizationsListScene()
                } label: {
                    ActionCellView(itemTitle: "Organizatons", iconColor: .orange, isCounting: true, itemIcon: Image(systemName: "building.2"))
                }

                
                NavigationLink {
                    RepositoriesListScene()
                        .navigationBarTitleDisplayMode(.large)
                } label: {
                    ActionCellView(itemTitle: "Starred", iconColor: .yellow, isCounting: true, itemIcon: Image(systemName: "star"))
                }

            }.listStyle(.plain)
        }
            
    }
}

struct ProfileSceneView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProfileSceneView()
        }
    }
}
