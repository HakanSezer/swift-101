//
//  ViewController.swift
//  AlertHome
//
//  Created by Hakan Sezer on 13.09.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passWordTwoTextField: UITextField!
    @IBOutlet weak var passWordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    
    //Function
    func aletAction(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default,handler: nil)
        alert.addAction(okButton)
        self.present(alert,animated: true,completion: nil)
    }

    @IBAction func registerButton(_ sender: Any) {
        
        
        if userNameTextField.text == "" {
            aletAction(title: "Error!", message: "Username Not Found!")
            
        }else if passWordTextField.text == "" {
            aletAction(title: "Error!", message: "Password Not Found!")
            
        }else if passWordTextField.text != passWordTwoTextField.text {
            aletAction(title: "Error", message: "Passwords are different!")
        }else {
            aletAction(title: "Good Job", message: "Your Welcome!")
            
        }
        
    }
    
}

