//
//  UsersSceneView.swift
//  QuickGitUI
//
//  Created by Ahmed Fathy on 28/10/2022.
//

import SwiftUI

struct UsersSceneView: View {
    @State var users: [User] = [User]()
    var body: some View {
        List (users, id: \.id) { user in
            NavigationLink {
                ProfileSceneView()
                    .navigationBarTitleDisplayMode(.inline)
            } label: {
                UserCellView(login: user.login , imageString: user.avatarURL)
            }
        }.task {
            do {
                var userList: Users = try await NetworkService.shared.loadData(from: UsersRouter.allUsers(perPage: 10, pageNo: 1))
                users = userList.items
            }
            catch { print(error) }
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
