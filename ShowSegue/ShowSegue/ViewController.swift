//
//  ViewController.swift
//  ShowSegue
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
        
        // Gidilmesi istenen sayfanın buluduğu storyboard tanımlanır.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        // Gidilmek istenen sayfanını idsini yazarak ViewController nesnesi oluşturulur.
        let goToViewController = storyboard.instantiateViewController(withIdentifier: "sayfa2") as! ViewController2
        
        // gidilecek View Controller'a navigation özelliği ile push segue geçişi yapılır.
        navigationController?.pushViewController(goToViewController, animated: true)
    }
    
}

