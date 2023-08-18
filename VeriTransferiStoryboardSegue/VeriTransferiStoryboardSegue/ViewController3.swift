//
//  ViewController3.swift
//  VeriTransferiStoryboardSegue
//
//  Created by Hakan Sezer on 18.08.2023.
//

import UIKit

class ViewController3: UIViewController {

    @IBOutlet weak var etiketC: UILabel!
    
    var mesajC: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        etiketC.text = mesajC!
    }
    


}
