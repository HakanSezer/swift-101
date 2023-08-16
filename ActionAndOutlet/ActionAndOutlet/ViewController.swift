//
//  ViewController.swift
//  ActionAndOutlet
//
//  Created by Hakan Sezer on 16.08.2023.
//

import UIKit

class ViewController: UIViewController {

    // Burada Label kontrol kontrol etmiş oluyoruz.
    //Bu Label içerisinde yazacağımız zaman bunu üzerinden ilerliyoruz.
    @IBOutlet weak var text: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Uygulama ilk açıldığı zaman bize ne yazaması gerektiğini gösteriyor yani bu ilk böyle olduğunda rahat bir şekilde yazabiliyoruz.
        text.text = "Button'a Bass"
    }

    
    // Buton atadığımız bi özellik sayesinde label içerisindeki yazıyı kullanabiliyoruz.  
    @IBAction func helloButton(_ sender: Any) {
        text.text = "Welcome"
    }
    
}

