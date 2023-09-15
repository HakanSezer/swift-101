//
//  DetailsVC.swift
//  SimpsonBook
//
//  Created by Hakan Sezer on 15.09.2023.
//

import UIKit

class DetailsVC: UIViewController {

    @IBOutlet weak var jobLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    // İlk ViewController içerisinde kullanabilmek için gereklidir.
    var selectedSimspon : SimpsonClass?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = selectedSimspon?.nameSimpson
        // Enum içerisinde olduğu için. Direk yazıkca Label içerisinde Option düşüyor bu yüzden böyle yazarak düzeliyoruz.
        jobLabel.text = String?("\(String(describing: selectedSimspon?.jobsSimpson))")
        imageView.image = selectedSimspon?.imageSimpson
        
    }

}
