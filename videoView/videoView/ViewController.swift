//
//  ViewController.swift
//  videoView
//
//  Created by Hakan Sezer on 22.08.2023.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func playVideo(_ sender: Any) {
        
        // video tanıtıyoruz.
        if let dosyaYolu = Bundle.main.path(forResource: "video", ofType: "mp4") {
            // dosya konumu belirtik.
            let oynatici = AVPlayer(url: URL(fileURLWithPath: dosyaYolu))
            
            // Oynatici ara yüzüyle ilgili kontroller
            let oynaticiKontrol = AVPlayerViewController()
            
            oynaticiKontrol.player = oynatici
            
            present(oynaticiKontrol, animated: true) {
                oynatici.play()
            }
        }
        
        
    }
    

}

