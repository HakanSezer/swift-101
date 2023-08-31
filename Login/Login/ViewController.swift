//
//  ViewController.swift
//  Login
//
//  Created by Hakan Sezer on 31.08.2023.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - UI Elements
    @IBOutlet weak var kullanıcıAdiTextField: UITextField!
    
    @IBOutlet weak var sifreTextField: UITextField!
    
    let d = UserDefaults.standard
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ka = d.string(forKey: "kullaniciAdi") ?? "bos"
        let s = d.string(forKey: "sifre") ?? "bos"
        
        // Boş değilse öteki sayfaya aktar.
        if ka != "bos" && s != "bos" {
            performSegue(withIdentifier: "girisToAnasayfa", sender: nil)
        }
    }
    
    // Uygulama başladığında kullanılıyor.
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    // Uygulama kapandığında kullanılıyor.
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
    
    // MARK: - Action
    @IBAction func girisYapButton(_ sender: Any) {
        
        if let ka = kullanıcıAdiTextField.text , let s = sifreTextField.text {
            if ka == "admin" && s == "123456" {
                
                d.set(ka, forKey: "kullaniciAdi")
                d.set(s, forKey: "sifre")
                
                performSegue(withIdentifier: "girisToAnasayfa", sender: nil)
            }else {
                print("Hatalı Giriş")
            }
            
        }
        
    }
}
