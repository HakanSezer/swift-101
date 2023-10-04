//
//  ViewController.swift
//  InstagramClone
//
//  Created by Hakan Sezer on 28.09.2023.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
            }

    @IBAction func signInClicked(_ sender: Any) {
        // Sign Clicked işleme bakıyoruz.
        if emailText.text != "" && passwordText.text != "" {
            
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { AuthData, error in
                if error != nil {
                    // Firebase şifreyi otomatik olarak kontrol etmiş olacak.
                    self.makeAlert(titleInput: "Error!", messageInput: error?.localizedDescription ?? "Error")
                }else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
            
        }else {
            makeAlert(titleInput: "Error", messageInput: "Userame / Password? ")
        }
    }
    @IBAction func signUpClicked(_ sender: Any) {
        // Kullannıcı işlemlerini aktif eder. Bunu kullanabilmek için. Firebase import etmek lazım
        // Obje oluşturmayı sağlar
        
        if emailText.text != "" && passwordText.text != "" {
            // Firebase, üzerinde kayıt yapmak isteidğimiz zaman bunu kullanıyoruz.
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { AuthData, error in
                if error != nil {
                    // message içirisindeki error?.localizedDescription -> Firebase içerisinde bulunan mesajı çekmiş olacaktır.
                    self.makeAlert(titleInput: "Error!", messageInput: error?.localizedDescription ?? "Error")
                }else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        }else {
            makeAlert(titleInput: "Error", messageInput: "Userame / Password? ")
        }
        
        
    }
    
    func makeAlert(titleInput: String, messageInput: String) {
        let alert = UIAlertController(title: titleInput, message: messageInput , preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel)
        alert.addAction(okButton)
        self.present(alert,animated: true, completion: nil)
        
    }
    
}

