//
//  ActionCellView.swift
//  QuickGitUI
//
//  Created by Ahmed Fathy on 28/10/2022.
//

import SwiftUI

struct ActionCellView: View {
    let itemTitle: String
    let iconColor: Color
    let isCounting: Bool
    let itemIcon: Image
    var body: some View {
        HStack {
            itemIcon
                .imageScale(.small)
                .frame(width: 24, height: 24, alignment: .center)
                .background(iconColor)
                .foregroundColor(.white)
                .cornerRadius(5)
            Text(itemTitle)
            Spacer()
            Text(isCounting ? "0" : "")
                .foregroundColor(.gray)
        }
    }
}

struct ActionCellView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            ActionCellView(itemTitle: "Issues", iconColor: .green, isCounting: true, itemIcon: Image(systemName: "smallcircle.filled.circle"))
            ActionCellView(itemTitle: "Pull Requests", iconColor: .blue, isCounting: true, itemIcon: Image(systemName: "arrow.triangle.pull"))
            ActionCellView(itemTitle: "Browse Code", iconColor: .gray, isCounting: false, itemIcon: Image(systemName: "arrow.triangle.pull"))

        }
    }
}
