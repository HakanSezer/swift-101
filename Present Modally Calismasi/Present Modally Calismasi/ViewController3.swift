//
//  ViewController3.swift
//  Present Modally Calismasi
//
//  Created by Hakan Sezer on 16.08.2023.
//

import UIKit

class ViewController3: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func goToOne(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let goToOneViewController = storyboard.instantiateViewController(withIdentifier: "sayfa1") as! ViewController
        
        self.present(goToOneViewController,animated: true,completion: nil)
    }
    
    //MARK: İkici sayfaya dönüş
    @IBAction func goToTwo(_ sender: Any) {
        
        
        //İlk Storyboard belirtiyoruz.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        
        // Gideceğimiz yeri beliriyoruz.
        let goToTwoViewController = storyboard.instantiateViewController(withIdentifier: "sayfa2") as? ViewController2
        
        // şimdi de animasyon belirtiyoruz.
        self.present(goToTwoViewController!,animated: true,completion: nil)
    }
    

}
