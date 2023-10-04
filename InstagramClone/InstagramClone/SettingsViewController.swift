//
//  SettingsViewController.swift
//  InstagramClone
//
//  Created by Hakan Sezer on 28.09.2023.
//

import UIKit
import Firebase

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backViewClicked(_ sender: Any) {
        do {
            //Firebase tarafında kullanmış olduğumuz çıkış kodu.
            try Auth.auth().signOut()
            self.performSegue(withIdentifier: "toViewController", sender: nil)
        }catch {
            
        }
        
    }
    

}
