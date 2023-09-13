//
//  ViewController.swift
//  birthdayApp
//
//  Created by Hakan Sezer on 13.09.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let storedName = UserDefaults.standard.object(forKey: "Name")
        let storedBirthday = UserDefaults.standard.object(forKey: "Birthday")
        
        if let nemName = storedName as? String {
            nameLabel.text = nemName
        }
        if let newBirthday = storedBirthday as? String {
            birthdayLabel.text = newBirthday
        }
    }

    
    
    @IBAction func saveAction(_ sender: Any) {
        // Kayıt Code
        UserDefaults.standard.set(nameTextField.text!, forKey: "Name")
        UserDefaults.standard.set(birthdayTextField.text!, forKey: "Birthday")
        
        // Kodun çalışması.
        if let sayi = Int(birthdayTextField.text!) {
            birthdayLabel.text = birthdayTextField.text
        }else {
            birthdayLabel.text = "Lütfen Sayi Girin."
        }
        
        if let yazi = Int(nameTextField.text!) {
            nameLabel.text = "Lütfen Harf Giriniz."
        }else {
            nameLabel.text = nameTextField.text
        }
        
        //nameLabel.text = nameTextField.text
        //birthdayLabel.text = birthdayTextField.text
        
    }
    
    @IBAction func clearButton(_ sender: Any) {
        
        let storedName = UserDefaults.standard.object(forKey: "Name")
        let storedBirthday = UserDefaults.standard.object(forKey: "Birthday")
        
        if let newName = storedName as? String {
            UserDefaults.standard.removeObject(forKey: "Name")
        }else {
            nameLabel.text = "Name"
        }
        
        if let newBirthday = storedBirthday as? String {
            UserDefaults.standard.removeObject(forKey: "Birthday")
        }else {
            birthdayLabel.text = "Birthday"
        }
        
    }
}

