//
//  OrganizationCell.swift
//  QuickGitUI
//
//  Created by Ahmed Fathy on 02/11/2022.
//

import SwiftUI

struct OrganizationCell: View {
    var body: some View {
        HStack (alignment: .top) {
            Image(systemName: "building.2")
                .scaleEffect(x: 1.8, y: 1.8, anchor: .center)
                .frame(width: 60, height: 60, alignment: .center)
                .background(Color.green)
                .cornerRadius(6)
            VStack (alignment: .leading) {
                Text("Organization")
                    .fontWeight(.bold)
                Text("Organization-handle")
                    .fontWeight(.medium)
                    .foregroundColor(.gray)
                Text("Description. lorem ipsum lorem ipsumorem ipsumloremf ")
            }.padding(.leading, 5)
        }
    }
}

struct OrganizationCell_Previews: PreviewProvider {
    static var previews: some View {
        List {
            OrganizationCell()
            OrganizationCell()
            OrganizationCell()
        }
    }
}
