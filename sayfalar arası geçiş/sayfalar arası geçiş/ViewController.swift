//
//  ViewController.swift
//  sayfalar arası geçiş
//
//  Created by Hakan Sezer on 17.08.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var girdiAlani: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func run(_ sender: Any) {
        // Storyboard'ın yerini söylemiş olduk.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // Hangi storyboardlar arasında geçiş sağlayacağız onu belirlemiş olduk.
        let goViewController2 = storyboard.instantiateViewController(withIdentifier: "sayfa2") as! ViewController2
        
        
        // Karşı tarafa göndereceğimiz mesaj verisini bu sayede gönderiyoruz.
        /// Unwarap yapmamız bizim uygulamanın çökmesini engelleyecektir..
        let gonderilecekMesaj = girdiAlani.text
        
        goViewController2.mesaj = gonderilecekMesaj!
        
        let gidecekKisi = Kisiler(kisiId: 222, kisiAd: "Hakan")
        
        goViewController2.kisi = gidecekKisi
        
        // Present Modally yönetini belirlemiş oluyoruz.
        self.navigationController?.pushViewController(goViewController2, animated: true)
    }
    

}

