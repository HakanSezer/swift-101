//
//  ViewController2.swift
//  VeriTransferiStoryboardSegue
//
//  Created by Hakan Sezer on 18.08.2023.
//

import UIKit

class ViewController2: UIViewController {
    @IBOutlet weak var etiketB: UILabel!
    // Nereye yazacağını göstermiş oluyoruz.
    var mesajB: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Sayfa çalıştığı zaman içerisinde ne yazacağını göstermiş oluyoruz.
        etiketB.text = mesajB!
    }
    

}
