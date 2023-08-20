//
//  ViewController.swift
//  ToolBar Calismasi
//
//  Created by Hakan Sezer on 21.08.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func geriButton(_ sender: Any) {
        textLabel.text = "Geri Button"
    }
    
    @IBAction func playButton(_ sender: Any) {
        textLabel.text = "Play Button"
    }
    @IBAction func homeButton(_ sender: Any) {
        textLabel.text = "Home Button"
    }
    
}

