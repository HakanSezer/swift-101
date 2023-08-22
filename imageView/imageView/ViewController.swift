//
//  ViewController.swift
//  imageView
//
//  Created by Hakan Sezer on 22.08.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func picOneButton(_ sender: Any) {
        imageView.image = UIImage(named: "resim")
    }
    
    @IBAction func picTwoButton(_ sender: Any) {
        imageView.image = UIImage(named: "stevejobs")

    }
    
}

