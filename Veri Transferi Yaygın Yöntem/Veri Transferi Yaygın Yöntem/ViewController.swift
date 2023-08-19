//
//  ViewController.swift
//  Veri Transferi Yaygın Yöntem
//
//  Created by Hakan Sezer on 19.08.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var girdiAlani: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func gonderB(_ sender: Any) {
        
        let alinanVeri = girdiAlani.text!
        
        performSegue(withIdentifier: "aToB", sender: alinanVeri)
        
        
    }
    @IBAction func gonderC(_ sender: Any) {
        // Girdi alanindan alınan veri yazdırdık.
        let alinanVeri = girdiAlani.text!
        
        performSegue(withIdentifier: "aToC", sender: alinanVeri)
    }
    
    // Bu sistem ile kendi alt yapımızda çalışıp çalışmadığını görmüş olacağız.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Buttonların içlerine gönderilen veri alanını ifler sayesinde bölmüş olduk.
        if segue.identifier == "aToB" {
            // Alt yapıda çalışmasını kontrol ettik.
            print("B'ye geçiş oldu.")
            
            // Veriyi burada kontrol ettik.
            if let veri = sender as? String {
                // nereden veri çekeceğimizi belirttik.
                let gidilecekVC = segue.destination as! ViewControllerB
                // B ViewController içerisine yazdırmayı sağladık.
                gidilecekVC.mesajB = veri
            }
            
        }
        if segue.identifier == "aToC" {
            print("C'ye geçiş oldu.")
            
            // oluşturmuş olduğumuz prepare yapısı içerisindeki sender Any? olduğu için bunu optional olup olmadığını kontrol ediyoruz.
            // bu veriyi sender Any?'den String türüne dönüştürüyoruz.
            if let veri = sender as? String{
                
                let gidecekVC = segue.destination as! ViewControllerC
                
                gidecekVC.mesajC = veri
            }
            
        }
    }
    

}

