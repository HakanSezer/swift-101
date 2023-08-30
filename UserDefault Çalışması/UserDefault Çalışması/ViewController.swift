//
//  ViewController.swift
//  UserDefault Çalışması
//
//  Created by Hakan Sezer on 30.08.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Veri kaydetme
        // bu veri kaydı yapabiliyoruz veri silebiliyoruz.
        let d = UserDefaults.standard
        
        d.set("Ahmet", forKey: "Ad")
        d.set(18, forKey: "yas")
        d.set(1.78, forKey: "boy")
        
        let arkadasListesi = ["ali", "veysel","ece"]
        
        d.set(arkadasListesi, forKey: "Liste")
        
        // Veri Okuma
        // ?? -> İki soru işareti her zaman varsayılan değeri temsil etmektedir.
        let ad = d.string(forKey: "ad") ?? "isim yok."
        let yas = d.integer(forKey: "yas")
        let boy = d.double(forKey: "boy")
        
        let dict = d.dictionary(forKey: "dict") as? [String:String] ?? [String:String]()
        
        // Kalıcı Silme
        d.removeObject(forKey: "ad")
        let adx = d.string(forKey: "ad") ?? "isim Yok"
        print(adx)
        
        // Güncelleme
        d.set("yeni Ahmet", forKey: "ad")
        
    }


}

