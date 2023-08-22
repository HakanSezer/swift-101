//
//  ViewController.swift
//  Slider - Stepper
//
//  Created by Hakan Sezer on 22.08.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var sliderLabel: UILabel!
    
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var stepperLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func sliderDegisim(_ sender: UISlider) {
        sliderLabel.text = "Slider : \(Int(slider.value))"
    }
    @IBAction func tikla(_ sender: Any) {
        print("Slider değer: \(Int(slider.value))")
        
        print("Slider değer: \(Int(stepper.value))")
        
    }
    
    @IBAction func stepperClick(_ sender: UIStepper) {
        stepperLabel.text = "Stepper: \(Int(sender.value))"
        
    }
    
}

