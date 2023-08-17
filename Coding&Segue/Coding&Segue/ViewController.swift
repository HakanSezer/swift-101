//
//  ViewController.swift
//  Coding&Segue
//
//  Created by Hakan Sezer on 17.08.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func goTo2(_ sender: Any) {
        // Kişiler dosyası üzerinden çektik.
        let nesne = Kisiler(kisiId: 222, kisiAd: "Hakan")
        // Button tıkladınız zaman bu metod çalışır. 1. olarak
        /// sender ile bilgi verilmiş oluruz.
        performSegue(withIdentifier: "gofrom1to2", sender: nesne)
    }
    // daha sonrasında bu metod çalışrı 2. olarak ve bunu arkasından sistem çalışmaya başlar.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //kişiler dosyasının verisini buraya girebilir hale getirdik.
        let gelenVeri = sender as? Kisiler
        
        print("Gelen veri : \(gelenVeri!.kisiId!) \(gelenVeri!.kisiAd!)")
        
        print("Geçiş Yapıldı. 1 To 2")
    }

}

