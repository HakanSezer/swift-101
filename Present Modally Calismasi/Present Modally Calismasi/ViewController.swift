//
//  ViewController.swift
//  Present Modally Calismasi
//
//  Created by Hakan Sezer on 16.08.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func goToTwo(_ sender: Any) {
        
        // Burada kendimiz için bir metod yapmış olduk.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // Burada yukarıda tanımla üzerinden devam ediyoruz.
        // Burada downCasting yapmış oluyoruz bu sayede hata başarısız olursa bile gitmesini sağlıyoruz.
        
        /// as! -> bir tipi başka bir tipe dönüştürmek için kullanılır. Dönüşüm sırasında hata varsa başarısız olur.
        let goToViewController = storyboard.instantiateViewController(withIdentifier: "sayfa2") as! ViewController2
        
        // Burada kodu geçiş animasyonlarını belirlemiş olduk.
        self.present(goToViewController,animated: true,completion: nil)
    }
    
}

