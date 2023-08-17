//
//  ViewController2.swift
//  sayfalar arası geçiş
//
//  Created by Hakan Sezer on 17.08.2023.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var etiket: UILabel!
    
    var mesaj:String?
    var kisi = Kisiler()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Kişi id: \(kisi.kisiId!)  Kisi ad:\(kisi.kisiAd!)")

       etiket.text = mesaj!
        

        
    }
    

  

}
