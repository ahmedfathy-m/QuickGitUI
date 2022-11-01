//
//  ContentView.swift
//  QuickGitUI
//
//  Created by Ahmed Fathy on 24/10/2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    @State var navTitle = "Home"

    var body: some View {
        NavigationView {
            TabView {
                Home()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                    .onAppear { navTitle = "Home" }
                VStack {}
                    .tabItem {
                        Label("Explore", systemImage: "binoculars.fill")
                    }
                    .onAppear { navTitle = "Explore" }
                VStack {}
                    .tabItem {
                        Label("Bookmarks", systemImage: "bookmark.fill")
                    }
                    .onAppear { navTitle = "Bookmarks" }
                ProfileSceneView()
                    .tabItem {
                        Label("Profile", systemImage: "person.fill")
                    }
                    .onAppear { navTitle = "Profile" }
            }
            .navigationTitle(navTitle)
            .toolbar {
                NavigationLink {
                    Text("Settings")
                        .navigationTitle("Settings")
                } label: {
                    Image(systemName: "gearshape.fill")
                }

            }
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
