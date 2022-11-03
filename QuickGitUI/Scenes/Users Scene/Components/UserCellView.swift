//
//  UserCellView.swift
//  QuickGitUI
//
//  Created by Ahmed Fathy on 28/10/2022.
//

import SwiftUI

struct UserCellView: View {
    let login: String
    let imageString: String
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: imageString)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50, alignment: .center)
                    .imageScale(.large)
                    .scaledToFill()
                    .background(Color.green)
                    .clipShape(Circle())
            } placeholder: {
                Image(systemName: "person.fill")
                    .frame(width: 50, height: 50, alignment: .center)
                    .imageScale(.large)
                    .scaledToFill()
                    .background(Color.green)
                    .clipShape(Circle())
            }

            Text(login)
            Spacer()
            Button("") {}
        }
    }
}

struct UserCellView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            UserCellView(login: "ahmedfathy-m", imageString: "https://avatars.githubusercontent.com/u/105666747?v=4")
                .contextMenu {
                    Button("Bookmark") {
                        print("Some dev name")
                    }
                }
        }
    }
}
