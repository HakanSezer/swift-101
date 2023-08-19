//
//  ViewControllerC.swift
//  Veri Transferi Yaygın Yöntem
//
//  Created by Hakan Sezer on 19.08.2023.
//

import UIKit

class ViewControllerC: UIViewController {
    @IBOutlet weak var etiketC: UILabel!
    
    var mesajC: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        etiketC.text = mesajC
    }
    

    

}
