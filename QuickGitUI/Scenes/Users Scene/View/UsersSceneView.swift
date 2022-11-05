//
//  UsersSceneView.swift
//  QuickGitUI
//
//  Created by Ahmed Fathy on 28/10/2022.
//

import SwiftUI

struct UsersSceneView: View {
    
    @StateObject var viewModel = UsersViewModel()
    @State var searchInit: Bool = false

    var body: some View {
        List {
            ForEach(viewModel.users) { user in
                NavigationLink {
                    ProfileSceneView()
                    //ProfileSceneView(login: user.login)
                        .navigationBarTitleDisplayMode(.inline)
                } label: {
                    UserCellView(login: user.login , imageString: user.avatarURL)
                }
            }
            if !(viewModel.users.isEmpty) {
                HStack {
                    Image(systemName: "timelapse")
                    Text("Loading")
                        .font(.footnote)
                }.task {
                    await viewModel.fetchUsers()
                }
            }
        }.task {
            await viewModel.fetchUsers()
        }.toolbar {
            NavigationSearchBar(text: $viewModel.searchQuery)
                .onSubmit {
                    searchInit.toggle()
                }
                .task(id: searchInit, priority: .background, {
                    print("triggered")
                    await viewModel.searchForUser()
                })
                .padding(.bottom, 4)
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
