//
//  ContentView.swift
//  FavoriteBookOne
//
//  Created by Hakan Sezer on 9.12.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            
            
            List {
                ForEach(myFavorites) { favorite in
                    Section(header: Text(favorite.title)) {
                        ForEach(favorite.elements) { element in
                            NavigationLink(destination: DetailsView(chosenFavoriteElement: element)) {
                                Text(element.name)
                            }
                        }
                    }
                }
            }.navigationTitle(Text("Favorite Book"))
        }
    }
}

#Preview {
    ContentView()
}
