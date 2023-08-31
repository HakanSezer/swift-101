//
//  AnaSayfaViewController.swift
//  Login
//
//  Created by Hakan Sezer on 31.08.2023.
//

import UIKit

class AnaSayfaViewController: UIViewController {
    @IBOutlet weak var sonucLabel: UILabel!
    
    let d = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Cancel Buttonu gitti.
        navigationItem.hidesBackButton = true
        
        let ka = d.string(forKey: "kullaniciAdi") ?? "bos"
        
        sonucLabel.text = ka
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        
        d.removeObject(forKey: "kullaniciAdi")
        d.removeObject(forKey: "sifre")
        
        exit(-1)
    }
    
}
