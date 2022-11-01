//
//  CommitCellView.swift
//  QuickGitUI
//
//  Created by Ahmed Fathy on 01/11/2022.
//

import SwiftUI

struct CommitCellView: View {
    @State var isCollapsed: Bool = true
    
    var body: some View {
        
        VStack (alignment: .leading, spacing: 5) {
            HStack {
                Text("Some Commit. Lorem Ipsum lorem ipsum lorem ipsum lorem ipsum")
                    .lineLimit(0)
                    .fontWeight(.medium)
                Text("5mo")
                    .foregroundColor(.gray)
            }
            HStack {
                Image(systemName: "person.fill")
                    .background(Color.green)
                    .foregroundColor(.gray)
                    .clipShape(Circle())
                Text("Some dev name")
                    .fontWeight(.medium)
                Text("Authored")
                    .fontWeight(.light)
                    .foregroundColor(.gray)
                Spacer()
                Image(systemName: "chevron.down")
                    .rotationEffect(isCollapsed ? .degrees(0):.degrees(180))
                    .offset(y: isCollapsed ? 0 : 30)
                    .animation(.linear, value: isCollapsed)
                    .onTapGesture {
                        isCollapsed.toggle()
                    }

            }
            HStack {
                Button {
                    
                } label: {
                    NavigationLink {
                        
                    } label: {
                        Image(systemName: "person.fill")
                            .font(.system(size: 10))
                            .background(Color.green)
                            .foregroundColor(.gray)
                            .clipShape(Circle())
                        Text("Some dev name")
                            .font(.system(size: 10))
                            .fontWeight(.medium)
                    }

                }.buttonStyle(.borderedProminent)
                    .cornerRadius(.greatestFiniteMagnitude)
                    .tint(.gray.opacity(0.3))

                
                Button {

                } label: {
                    NavigationLink {
                        
                    } label: {
                        Text("More...")
                            .font(.system(size: 10))
                    }.frame(width: 80)

                }.buttonStyle(.borderedProminent)
                    .cornerRadius(.greatestFiniteMagnitude)
                    .tint(.gray.opacity(0.3))
                Spacer(minLength: 40)
            }.padding(.top, 5)
        }
        .modifier(AnimatingCellHeight(height: isCollapsed ? 45 : 85))
        .animation(.default, value: isCollapsed)
    }
}

struct CommitCellView_Previews: PreviewProvider {

    static var previews: some View {
        List {
            CommitCellView()
            CommitCellView()
        }
    }
}

struct AnimatingCellHeight: AnimatableModifier {
    var height: CGFloat = 0

    var animatableData: CGFloat {
        get { height }
        set { height = newValue }
    }

    func body(content: Content) -> some View {
        content.frame(height: height, alignment: .top)
    }
}
