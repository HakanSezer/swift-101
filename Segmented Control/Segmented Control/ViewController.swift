//
//  ViewController.swift
//  Segmented Control
//
//  Created by Hakan Sezer on 22.08.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var uiSwitch: UISwitch!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func switchClick(_ sender: UISwitch) {
        if sender.isOn {
            print("Swtich Açık")
        }else {
            print("Switch Kapalı")
        }
    }
    
    @IBAction func click(_ sender: Any) {
        
        
        print("Switch Durum: \(uiSwitch.isOn)")
    }
    
    
    @IBAction func segmentedClick(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            print("Swtich Açık")
        }else if sender.selectedSegmentIndex == 1 {
            print("Switch Kapalı")
        }
    }
    
}

