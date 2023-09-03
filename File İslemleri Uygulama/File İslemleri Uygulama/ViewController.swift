//
//  ViewController.swift
//  File İslemleri Uygulama
//
//  Created by Hakan Sezer on 2.09.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textFieldGirdi: UITextField!
    
    @IBOutlet weak var resimTutucu: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Action
    @IBAction func yaz(_ sender: Any) {
        // TextField üzerinden kayıt edilecek veri alınır.
        let mesaj: String = textFieldGirdi.text!
        //döküman yolu alınır.
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            // kayıt edilemek istenen dosya yolu ve dosya oluşturulur.
            let dosyaYolu = dir.appendingPathComponent("dosyam.txt")
            
            //yazma işlemi
            do {
                try mesaj.write(to: dosyaYolu, atomically: false, encoding: String.Encoding.utf8)
                
                textFieldGirdi.text = " " // yazı kayıt edildikten sonra textfield boşaltılır.
                
            }catch {
                print("Dosya yazılırken hata oluştu.")
            }
            
        }
        
    }
    
    @IBAction func oku(_ sender: Any) {
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
        let dosyaYolu = dir.appendingPathComponent("dosyam.txt")
        
        do {
            
            textFieldGirdi.text = try String(contentsOf: dosyaYolu, encoding: String.Encoding.utf8)
        }catch {
            print("Dosya okurken hata oluştu.")
            }
        }
    }
    
    @IBAction func sil(_ sender: Any) {
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
        let dosyaYolu = dir.appendingPathComponent("dosyam.txt")
            
            // Dosya varsa oku ya da sil demiş oluyoruz.
            if FileManager.default.fileExists(atPath: dosyaYolu.path) {
                do {
                    
                    try FileManager.default.removeItem(at: dosyaYolu)
                    textFieldGirdi.text = " "
                }catch {
                    print("Dosya okurken hata oluştu.")
                    }
            }
        
        }
        
    }
    @IBAction func resimKaydet(_ sender: Any) {
        
        // TextField üzerinden kayıt edilecek veri alınır.
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            //döküman yolu alınır.
            let dosyaYolu = dir.appendingPathComponent("resimim.png")
            
            let resim = UIImage(named: "resimim.png")
            // kayıt edilemek istenen dosya yolu ve dosya oluşturulur.
            //yazma işlemi
            do {
                try resim!.pngData()?.write(to: dosyaYolu)
                
            }catch {
                print("Dosya yazılırken hata oluştu.")
            }
            
        }
    }
    @IBAction func resimGoster(_ sender: Any) {
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
        let dosyaYolu = dir.appendingPathComponent("resimim.png")
            
            self.resimTutucu.image = UIImage(contentsOfFile: dosyaYolu.path)
        }
        
    }
    @IBAction func resimSil(_ sender: Any) {
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
        let dosyaYolu = dir.appendingPathComponent("resimim.png")
            
            // Dosya varsa oku ya da sil demiş oluyoruz.
            if FileManager.default.fileExists(atPath: dosyaYolu.path) {
                do {
                    
                    try FileManager.default.removeItem(at: dosyaYolu)
                    
                }catch {
                    print("Dosya silerken hata oluştu.")
                    }
            }
        
        }
    }
    
    
    
    
    
    
    
    
}

