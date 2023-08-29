//
//  Filmler.swift
//  detayliCollection
//
//  Created by Hakan Sezer on 29.08.2023.
//

import Foundation

class Filmler {
    var filmId: Int?
    var filmBaslık: String?
    var filmResimAdi: String?
    var filmFiyat: Double?
    
    init() {
        
    }
    
    init(filmId: Int,filmBaslık: String,filmResimAdi: String,filmFiyat: Double) {
        self.filmId = filmId
        self.filmBaslık = filmBaslık
        self.filmResimAdi = filmResimAdi
        self.filmFiyat = filmFiyat
    }
}
