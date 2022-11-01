//
//  OrganizationScene.swift
//  QuickGitUI
//
//  Created by Ahmed Fathy on 02/11/2022.
//

import SwiftUI

struct OrganizationScene: View {
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
                        Text("Organization Name")
                            .font(.title)
                            .fontWeight(.bold)
                        Text("orghandle-m")
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
                Text("Org Description")
                    .padding(.bottom, 5)
                HStack {
                    Image(systemName: "location")
                        .foregroundColor(.gray)
                        .fontWeight(.bold)
                    Text("Location")
                }
                HStack {
                    Image(systemName: "link")
                        .foregroundColor(.gray)
                        .fontWeight(.bold)
                    Text("https://org-website.org")
                        .fontWeight(.bold)
                }
                HStack {
                    Image(systemName: "envelope")
                        .foregroundColor(.gray)
                        .fontWeight(.bold)
                    Text("org@org.org")
                        .fontWeight(.bold)
                }
                Button {
                    print("Follow")
                } label: {
                    Image(systemName: "plus")
                    Text("Follow")
                        .frame(width: UIScreen.main.bounds.width - 100)
                }.buttonStyle(.bordered)
                    

            }.padding()
                .background(Color.gray.opacity(0.2))
            List {
                NavigationLink {
                    RepositoriesListScene()
                } label: {
                    ActionCellView(itemTitle: "Repositories", iconColor: .gray, isCounting: true, itemIcon: Image(systemName: "book.closed"))
                }

            }.listStyle(.plain)
        }.navigationBarTitleDisplayMode(.inline)
    }
}

struct OrganizationScene_Previews: PreviewProvider {
    static var previews: some View {
        OrganizationScene()
    }
}
