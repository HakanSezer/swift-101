//
//  ViewControllerB.swift
//  Veri Transferi Yaygın Yöntem
//
//  Created by Hakan Sezer on 19.08.2023.
//

import UIKit

class ViewControllerB: UIViewController {
    @IBOutlet weak var etiketB: UILabel!
    
    var mesajB: String?

    
    override func viewDidLoad() {
        super.viewDidLoad()

        etiketB.text = mesajB
    }
    

}
