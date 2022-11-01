//
//  IssueCellView.swift
//  QuickGitUI
//
//  Created by Ahmed Fathy on 01/11/2022.
//

import SwiftUI

struct IssueCellView: View {
    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: "smallcircle.filled.circle")
                .foregroundColor(.green)
            VStack (alignment: .leading) {
                Text("Developer / Repoistory #000")
                    .foregroundColor(.gray)
                Text("Issue Name")
                    .fontWeight(.bold)
            }
            Spacer()
            Text("1mo")
        }
    }
}

struct IssueCellView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            IssueCellView()
            IssueCellView()
            IssueCellView()
            IssueCellView()
            IssueCellView()
        }
    }
}
