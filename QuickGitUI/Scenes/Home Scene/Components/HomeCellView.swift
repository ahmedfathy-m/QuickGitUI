//
//  HomeCellView.swift
//  QuickGitUI
//
//  Created by Ahmed Fathy on 24/10/2022.
//

import SwiftUI


struct HomeCellView: View {

    @State var menuIcon: Image
    @State var title: String
    @State var color: Color
    
    var body: some View {
        HStack {
            menuIcon
                .foregroundColor(.white)
                .frame(width: 25, height: 25, alignment: .center)
                .background(color)
                .cornerRadius(5)
            Text(title)
            Button("") {
                
            }
            Spacer()
//            Image(systemName: "chevron.right")
//                .foregroundColor(.gray)
        }
    }
}

struct HomeCellView_Previews: PreviewProvider {
    static var previews: some View {
        let icon = Image(systemName: "person")
        let title = "Users"
        let color = Color.green
        HomeCellView(menuIcon: icon, title: title, color: color)
    }
}
