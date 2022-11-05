//
//  Home.swift
//  QuickGitUI
//
//  Created by Ahmed Fathy on 25/10/2022.
//

import SwiftUI

struct Home: View {
    @State var didFetch: Bool = false
    @State var didReturnWithError: Bool = false
    @State var errorString: String = ""
    @State var login: String = ""
    
    var body: some View {
        List {
            Section ("Main") {
                // MARK: - NAVIGATION LINKS
                NavigationLink { ViewRouter.allUsers.instantiateView() } label: { HomeCellView(menuIcon: Image(systemName: "person"), title: "Users", color: .gray) }
                NavigationLink { ViewRouter.allRepositories.instantiateView() } label: { HomeCellView(menuIcon: Image(systemName: "book.closed"), title: "Repositories", color: .blue) }
                NavigationLink { ViewRouter.allIssues.instantiateView() } label: { HomeCellView(menuIcon: Image(systemName: "exclamationmark.circle"), title: "Issues", color: .green) }
                NavigationLink { ViewRouter.allOrgs.instantiateView() } label: { HomeCellView(menuIcon: Image(systemName: "building.2"), title: "Organizations", color: .orange) }
                
                // MARK: - GITHUB WEB
                Link(destination: URL(string: "https://github.com/")!) { HomeCellView(menuIcon: Image("github"), title: "Github Web", color: .red) }
            }
            
            Section("Favourites") {
                NavigationLink {
                    RepositorySceneView()
                        .navigationBarTitleDisplayMode(.inline)
                } label: {
                    RepositoryCellView()
                }
            }
            
            Section("App Mode") {
                NavigationLink {
                    Text("Auth")
                } label: {
                    HomeCellView(menuIcon: Image(systemName: "person.badge.key"), title: "Authenticated Mode", color: .green)
                }

            }
        }.navigationTitle("Home")
            .task {
                do {
                    let _: User = try await NetworkService.shared.loadData(from: UsersRouter.someUser(login: "wesbos"))
                } catch {
                    errorString = error.localizedDescription
                    didReturnWithError.toggle()
                }
            }.alert(errorString, isPresented: $didReturnWithError) { }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Home()
        }
    }
}
