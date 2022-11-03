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
    let menuItems = HomeMenu.allCases
    var body: some View {
        List {
            Section ("Main") {
                ForEach(menuItems, id: \.title) { item in
                    Navigator.navigateTo(Route(rawValue: item.title.lowercased())!) {
                        HomeCellView(menuIcon: Image(systemName: item.image), title: item.title, color: item.color)
                    }
                }
                Link(destination: URL(string: "https://github.com/")!) {
                    HomeCellView(menuIcon: Image("github"), title: "Github Web", color: .red)
                }
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
                    let user: User = try await NetworkService.shared.loadData(from: UsersRouter.someUser(login: "ahmedfathy-m"))
                    login = user.login
                    didFetch.toggle()
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
