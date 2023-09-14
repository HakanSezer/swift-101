//
//  SecondViewController.swift
//  Landmark Book
//
//  Created by Hakan Sezer on 14.09.2023.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var secondLabel: UILabel!
    
    var selectedLandName = ""
    var selectedLandmarkImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = selectedLandmarkImage
        secondLabel.text = selectedLandName
    }

}
