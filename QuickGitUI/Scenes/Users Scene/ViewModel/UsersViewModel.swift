//
//  UsersViewModel.swift
//  QuickGitUI
//
//  Created by Ahmed Fathy on 05/11/2022.
//

import Foundation

@MainActor
class UsersViewModel: ObservableObject {
    @Published var users: [User] = [User]()
    @Published var currentPage: Int = 0
    
    @Published var searchQuery: String = ""
    
    func fetchUsers() async {
        do {
            currentPage += 1
            let userList: Users = try await NetworkService.shared.loadData(from: UsersRouter.allUsers(perPage: 10, pageNo: currentPage))
            users.append(contentsOf: userList.items)
        }
        catch { print(error) }
    }
    
    func searchForUser() async {
        do {
            let userList: Users = try await NetworkService.shared.loadData(from: UsersRouter.serachForUser(searchQuery, perPage: 20, pageNo: 1))
            users = userList.items
        } catch {
            print(error)
        }
    }
}
