//
//  PullRequestCellView.swift
//  QuickGitUI
//
//  Created by Ahmed Fathy on 01/11/2022.
//

import SwiftUI

struct PullRequestCellView: View {
    var body: some View {
        HStack(alignment: .top) {
            Image("pull (1)")
                .renderingMode(.template)
                .foregroundColor(.green)
            VStack (alignment: .leading) {
                Text("Developer / Repoistory #000")
                    .foregroundColor(.gray)
                Text("Pull Request Description")
                    .fontWeight(.bold)
            }
            Spacer()
            Text("1mo")
        }
    }
}

struct PullRequestCellView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            PullRequestCellView()
            PullRequestCellView()
        }
    }
}
