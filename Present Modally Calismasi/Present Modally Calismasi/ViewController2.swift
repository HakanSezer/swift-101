//
//  ViewController2.swift
//  Present Modally Calismasi
//
//  Created by Hakan Sezer on 16.08.2023.
//

import UIKit

class ViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    // Back Click
    @IBAction func clickDismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func goToThree(_ sender: Any) {
        
        // bulunduğu Storyboard sayfasını belirtiyoruz.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let goToViewController = storyboard.instantiateViewController(withIdentifier: "sayfa3") as! ViewController3
        
        // Metod
        self.present(goToViewController,animated: true,completion: nil)
        
    }
}
