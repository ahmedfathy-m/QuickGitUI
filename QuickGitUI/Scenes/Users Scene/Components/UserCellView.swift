//
//  UserCellView.swift
//  QuickGitUI
//
//  Created by Ahmed Fathy on 28/10/2022.
//

import SwiftUI

struct UserCellView: View {
    var body: some View {
        HStack {
            Image(systemName: "person.fill")
                .frame(width: 50, height: 50, alignment: .center)
                .imageScale(.large)
                .scaledToFill()
                .background(Color.green)
                .clipShape(Circle())
            Text("Some Dev Name")
            Spacer()
            Button("") {}
        }
    }
}

struct UserCellView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            UserCellView()
                .contextMenu {
                    Button("Bookmark") {
                        print("Some dev name")
                    }
                }
            UserCellView()
        }
    }
}
