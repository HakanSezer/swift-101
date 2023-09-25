//
//  ViewController.swift
//  CurrencyConverterApp
//
//  Created by Hakan Sezer on 25.09.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var cadLabel: UILabel!
    @IBOutlet weak var tryLabel: UILabel!
    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var jpyLabel: UILabel!
    @IBOutlet weak var gbpLabel: UILabel!
    @IBOutlet weak var chfLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    @IBAction func getRatesClicked(_ sender: Any) {
        // 1. Request & Session - İnternete gidip URL'i almak. App içinde istek yollamak
        // 2. Response & Data - Bu isteği almak.
        // 3. Parsing & JSON Serialization - Bu datayı almak.
        
        
        // 1. Adım
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=814368afff4c27ce448cad2066cee4bb")
        
        // Objeyi çağırmayı sağlayacak.
        let session = URLSession.shared
        
        // Closure
        let task = session.dataTask(with: url!) { data, response, error in
            if error != nil {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                let okButton = UIAlertAction(title: "OK", style: .default)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
            }else {
                // 2. Adim
                if data != nil {
                    
                    do {
                        // ilk sırada Dictionary olarak başlatıyoruz. İkinci'de String olsun diyoruz.
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                        
                        //ASYNC
                        
                        // 3.
                        DispatchQueue.main.async {
                            if let rates = jsonResponse["rates"] as? [String : Any] {
                                if let cad = rates["CAD"] as? Double {
                                    self.cadLabel.text = String("CAD: \(cad)")
                                }
                                if let chf = rates["CHF"] as? Double {
                                    self.chfLabel.text = String("CHF: \(chf)")
                                }
                                if let gbp = rates["GBP"] as? Double {
                                    self.gbpLabel.text = String("GBP: \(gbp)")
                                }
                                if let jpy = rates["JPY"] as? Double {
                                    self.jpyLabel.text = String("JPY: \(jpy)")
                                }
                                if let usd = rates["USD"] as? Double {
                                    self.usdLabel.text = String("USD: \(usd)")
                                }
                                if let tryLira = rates["TRY"] as? Double {
                                    self.tryLabel.text = String("TRY: \(tryLira)")
                                }
                                
                            }
                        }
                        
                    }catch {
                        print("Error")
                    }
                    
                    
                    
                    
                }
            }
        }
        
        task.resume()
        
    }
    
}

