//
//  FavoriteModel.swift
//  FavoriteBookOne
//
//  Created by Hakan Sezer on 9.12.2023.
//

import Foundation
import SwiftUI

// Bununla ID sormuyor olacak.
struct FavoriteModel: Identifiable {
    var id = UUID()
    var title: String
    var elements: [FavoriteElements]
}

struct FavoriteElements: Identifiable {
    var id = UUID()
    var name: String
    var imageName: String
    var description: String
}

// MARK: - BANDS
let metallica = FavoriteElements(name: "Metallica", imageName: "metallica", description: "No 1 Music Band!")
let megadeth = FavoriteElements(name: "Megadeth", imageName: "megadeth", description: "No 2 Music Band!")
let ironmaiden = FavoriteElements(name: "Iron Maiden", imageName: "ironmaiden", description: "No 3 Music Band!")

let favoriteBands = FavoriteModel(title: "Favorite Bands", elements: [metallica,megadeth,ironmaiden])

//MARK: - Movies
let pulpfitction = FavoriteElements(name: "Pulp Fiction", imageName: "pulpfiction", description: "No 1 Movie")
let thedarkknight = FavoriteElements(name: "The Dark Knight", imageName: "thedarkknight", description: "No 2 Movie")
let killbill = FavoriteElements(name: "Kill Bill", imageName: "killbill", description: "No 3 Movie")

let favoriteMovies = FavoriteModel(title: "Favorite Bands", elements: [pulpfitction,megadeth,ironmaiden])

let myFavorites = [favoriteBands, favoriteMovies]
