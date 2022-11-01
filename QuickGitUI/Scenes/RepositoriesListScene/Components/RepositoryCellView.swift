//
//  RepositoryCellView.swift
//  QuickGitUI
//
//  Created by Ahmed Fathy on 28/10/2022.
//

import SwiftUI

struct RepositoryCellView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "lock")
                Text("SomeRepoName")
                    .fontWeight(.bold)
            }
            Text("Details about said repo. lorem ipsum lorem ipsum lorem ipsum")
                .foregroundColor(.gray)
                .padding(.bottom, 2)
            HStack {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                Text("50")
                Image(systemName: "circle.fill")
                    .foregroundColor(.red)
                Text("Swift")
            }
        }
    }
}

struct RepositoryCellView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            RepositoryCellView()
            RepositoryCellView()
        }
    }
}
