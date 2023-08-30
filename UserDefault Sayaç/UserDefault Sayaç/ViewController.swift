//
//  ViewController.swift
//  UserDefault Sayaç
//
//  Created by Hakan Sezer on 30.08.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelSayac: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let d = UserDefaults.standard
        
        var sayas = d.integer(forKey: "sayac")
        
        sayas = sayas + 1
        
        // Veriyi kayıt etmek için kullanılır.
        d.set(sayas, forKey: "sayac")
        
        labelSayac.text = "Sayac : \(sayas)"
        
        
        
    }


}

