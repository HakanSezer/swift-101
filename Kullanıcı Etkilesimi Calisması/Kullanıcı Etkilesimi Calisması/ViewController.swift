//
//  ViewController.swift
//  Kullanıcı Etkilesimi Calisması
//
//  Created by Hakan Sezer on 23.08.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textLabe: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func basicAlert(_ sender: Any) {
        //Alert ilk oluşumu.
        let alertController = UIAlertController(title: "Başlık", message: "", preferredStyle: .alert)
        
        // Alert'in içerisinde bulunan iptal Buttonu
        let iptalAction = UIAlertAction(title: "İptal", style: .cancel) {
            action in
            print("İptal Tıklandı.")
        }
        //iptal buttonun görünür olması için kullanıyoruz.
        // Bu buttonu alertin içerisine koyuyor.
        alertController.addAction(iptalAction)
        // Alert içerisine button oluşturulması sağlanıyor.
        let tamamAction = UIAlertAction(title: "Tamam", style: .destructive) {
            action in
            print("Tamam Tıklandı.")
        }
        // Buton haline getirilmiş olan tamam buttonu alert içerisine ekleniyor.
        alertController.addAction(tamamAction)
        
        // Bu alert'in ekranda görünebilmesi için yazılmış olan kodttur.
        // Ekranda görünmesi sağlanıyor. Animasyon oluşturuyor.
        self.present(alertController, animated: true)
        
        
    }
    @IBAction func ozelAlert(_ sender: Any) {
        let alertController = UIAlertController(title: "Başlık", message: "Mesaj", preferredStyle: .alert)
        
        //Email Clouser
        ///Ekrana Çıkacak Alert içerisinde TextField yazmış oluyoruz.
        alertController.addTextField { textfield in
            textfield.placeholder = "Email"
            textfield.keyboardType = .emailAddress
        }
        // Şifre Clouser
        ///Ekrana Çıkacak Alert içerisinde TextField yazmış oluyoruz.
        alertController.addTextField { textfield in
            textfield.placeholder = "Şifre"
            textfield.isSecureTextEntry = true
        }
        
        
        
        // .destructive Tamam için kullanılır.
        let kaydetAction = UIAlertAction(title: "Kaydet.", style: .destructive) {
            action in
            // Kaçıncı textFiel olduğunu belirtmiş oluyruz. ve upcasting yapıyoruz.
            let alinanEmail = (alertController.textFields![0] as UITextField).text!
            
            // Kaçıncı textFiel olduğunu belirtmiş oluyruz. ve upcasting yapıyoruz.
            let sifreEmail = (alertController.textFields![1] as UITextField).text!
            
            //Buradan'da tanımlamış olduğumuz Label içzerisine bunları yazdırmış oluyoruz.
            self.textLabe.text = "Email: \(alinanEmail) - Şifre: \(sifreEmail)"
        }
        //Buton tanımlanmasını ekrana taşıyoruz.
        alertController.addAction(kaydetAction)
        
        
        // Animasyon görünmesi ile direk alert görmek için kullanıyoruz.
        self.present(alertController, animated: true)
        
    }
    @IBAction func actionSheet(_ sender: Any) {
    }
    

}

