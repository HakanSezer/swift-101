//
//  ViewController.swift
//  Button-Label-TextField
//
//  Created by Hakan Sezer on 21.08.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textLabel: UILabel!
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func click(_ sender: Any) {
        
        if textField.text == "" {
            textLabel.text = "Kullanıcı Adı Yok."
        }else {
            if let text = textField.text {
                textLabel.text = "Merhaba \(text)"
            }
            
        }
        
        if let veri = textView.text {
            print(veri)
        }
        
    }
    

}

