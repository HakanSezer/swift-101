//
//  ViewController.swift
//  VeriTransferiStoryboardSegue
//
//  Created by Hakan Sezer on 18.08.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var girdiAlani: UITextField!
    // Yazmamız gereken yer için gerekli olandır.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    // Bu durum ile Sayfalar arası geçiş sağlamış oluyor.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // TextField içerisinden veri buraya alıyoruz.
        let gidecekMesaj = girdiAlani.text!
        
        
        // doğru yere gittiğini burda kontrol ediyoruz.
        if segue.identifier == "aToB" {
            print("a dan B ye geçiş")
            
            // gidilecek yeri burada belirlemiş oluyoruz. Girilen veriyi nereye aktarmamız gerekiyor onu anlatmış oluyoruz.
            let gidilecekVC = segue.destination as! ViewController2
            
            // içerisine koymuş oluyoruz. Yazılmış olan veriyi nereden gideceğini belirtiyoruz.
            gidilecekVC.mesajB = gidecekMesaj
            
        }
        
        if segue.identifier == "aToC" {
            print("A'dan C'ye geçiş.")
            
            let gidilecekVC = segue.destination as! ViewController3
            
            gidilecekVC.mesajC = gidecekMesaj
        }
    }

}

