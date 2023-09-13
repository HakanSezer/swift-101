//
//  ViewController.swift
//  GestureRecognizer
//
//  Created by Hakan Sezer on 13.09.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    
    var imageTurn = true
    override func viewDidLoad() {
        super.viewDidLoad()
        // Tıklanabilirlik sağlayacaktır
        imageView.isUserInteractionEnabled = true
        // Action Buttonu seçmek için kullanıyoruz.
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changePic))
        //imageView içerisine ekliyoruz
        imageView.addGestureRecognizer(gestureRecognizer)
    }

    @objc func changePic() {
        
        
        if imageTurn == true {
            imageView.image = UIImage(named: "james")
            myLabel.text = "James"
            imageTurn = false
        }else if imageTurn == false {
            imageView.image = UIImage(named: "kirk")
            myLabel.text = "kirk"
            imageTurn = true
            
        }
        
    }
}

