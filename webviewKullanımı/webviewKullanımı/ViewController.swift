//
//  ViewController.swift
//  webviewKullanımı
//
//  Created by Hakan Sezer on 22.08.2023.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://gelecegiyazanlar.turkcell.com.tr/")!
        
        webView.load(URLRequest(url: url))
        
    }


}

