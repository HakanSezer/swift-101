//
//  ViewController3.swift
//  ShowSegue
//
//  Created by Hakan Sezer on 16.08.2023.
//

import UIKit

class ViewController3: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    /*
    @IBAction func goHome(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let goHome = storyBoard.instantiateViewController(withIdentifier: "sayfa1") as! ViewController
        navigationController?.popViewController(animated: true)
    }
    */
    @IBAction func goToBack(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let goHome = storyBoard.instantiateViewController(withIdentifier: "sayfa2") as! ViewController2
        self.present(goHome,animated: true,completion: nil)
    }
    

}
