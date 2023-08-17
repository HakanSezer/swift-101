//
//  Kisiler.swift
//  sayfalar arası geçiş
//
//  Created by Hakan Sezer on 17.08.2023.
//

import Foundation

class Kisiler {
    var kisiId:Int?
    var kisiAd:String?
    
    init() {
        
    }
    
    init(kisiId: Int, kisiAd: String) {
        self.kisiId = kisiId
        self.kisiAd = kisiAd
    }
}
