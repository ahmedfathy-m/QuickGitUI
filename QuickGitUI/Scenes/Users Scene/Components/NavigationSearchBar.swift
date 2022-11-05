//
//  NavigationSearchBar.swift
//  QuickGitUI
//
//  Created by Ahmed Fathy on 05/11/2022.
//

import SwiftUI

struct NavigationSearchBar: View {
    @Binding var text: String
    @State var isSearchEnabled: Bool = false
    var body: some View {
        ZStack(alignment: .trailing) {
            Button {
                withAnimation(.easeOut) { isSearchEnabled.toggle() }
            } label: {
                Image(systemName: "magnifyingglass")
            }.opacity(isSearchEnabled ? 0 : 1)
            HStack {
                TextField("Search", text: $text)
                    .padding(8)
                    .background(.ultraThinMaterial)
                    .cornerRadius(6)
                Button("Cancel") {
                    withAnimation(.easeOut) { isSearchEnabled.toggle() }
                }.buttonStyle(.borderedProminent)
            }.frame(width: 340)
                .opacity(isSearchEnabled ? 1 : 0)
        }
        HStack {
        }
    }
}

struct NavigationSearchBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            List {

            }.toolbar {
                NavigationSearchBar(text: .constant(""))
                    .padding()
            }

        }
//        NavigationSearchBar()
//            .padding()
    }
}
