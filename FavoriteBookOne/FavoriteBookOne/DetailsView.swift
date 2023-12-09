//
//  DetailsView.swift
//  FavoriteBookOne
//
//  Created by Hakan Sezer on 9.12.2023.
//

import SwiftUI

struct DetailsView: View {
    
    var chosenFavoriteElement: FavoriteElements
    
    var body: some View {
        VStack {
            Image(chosenFavoriteElement.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(chosenFavoriteElement.name)
                .font(.largeTitle)
                .padding()
            
            Text(chosenFavoriteElement.description)
            
        }
    }
}

#Preview {
    DetailsView(chosenFavoriteElement: thedarkknight)
}
