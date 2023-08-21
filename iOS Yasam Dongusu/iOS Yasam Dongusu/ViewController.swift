//
//  ViewController.swift
//  iOS Yasam Dongusu
//
//  Created by Hakan Sezer on 21.08.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    // ViewDidLoad bir kere çalışır sayfa ilk açıldığı zaman.
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad çalıştı.")
    }
    // Ekranda kullanıcıya görünmeden biraz önce çalışır.
    /// bu bize arayüzü yenilemek network islemlerini baslatmak gibi islemler için son şanstır.
    /// bu metod yasam döngüsünde birden fazla kez çalışabilir.
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear çalıştı.")
    }
    /// UIViewController göründüğü anda çalışır.
    /// Animasyon başlatmak
    /// ekran açıldığında bir video veya ses oynatılacaksa
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear Çalıştı.")
    }
    /// ViewController ekrandan kaybolmadan hemen önce çalışır
    /// bir çok defa çalışır
    /// sayfalar arası geçişlerde sayfadan ayrılırken çokça çalışır.
    /// Klavye gizleme Video veya ses gibi meydaları durdurma
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear çalıştı.")
    }
    /// ViewController ekrandan kaybolunca çalışır.
    /// network bağlantısı kesme (Bluetooth gibi v.b)
    override func viewDidDisappear(_ animated: Bool) {
        print("vİewDidDisappear çalıştı.")
    }
    
    // İlk çalışanlar olarak ilk
    /// viewDidLoad
    /// viewWillAppaear
    /// viewDidAppaear
    /// Çalışıyor daha sonrasında butona basınca daha sonra gerisi çalışır.
    /// 

    //MARK: NOT
    /// Sayfa geçişi olunca Disappearlar çalışır
    /// Sayfaya geri döneceğiniz zaman Appearlar çalışıyor
    /// İlkkez çalışıyorsa DidLoad çalışıyor.
}

