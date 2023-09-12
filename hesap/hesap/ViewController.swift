//
//  ViewController.swift
//  hesap
//
//  Created by Hakan Sezer on 12.09.2023.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - UI Elements
    @IBOutlet weak var firstNumber: UITextField!
    @IBOutlet weak var secoundNumber: UITextField!
    @IBOutlet weak var sonucLabel: UILabel!
    
    
    var result = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Functions
    func process() {
        
    }
    
    
    
    @IBAction func toplamaButton(_ sender: Any) {
        
        
        if let oneNumber = Int(firstNumber.text!) {
            if let twoNumber = Int(secoundNumber.text!) {
                result = oneNumber + twoNumber
                
                sonucLabel.text = String(result)
            }else {
                sonucLabel.text = "Lütfen Sayı giriniz."
            }
        }else {
            sonucLabel.text = "Lütfen Sayı giriniz."
        }
    }
    
    @IBAction func cıkarmaButton(_ sender: Any) {
    }
    @IBAction func carpmaButton(_ sender: Any) {
    }
    @IBAction func bolmeButton(_ sender: Any) {
    }
    
}

