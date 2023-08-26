//
//  ViewController.swift
//  Coklu TableView Aynı ViewController
//
//  Created by Hakan Sezer on 26.08.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var ulkelerTableView: UITableView!
    
    @IBOutlet weak var sehirlerTableView: UITableView!
    
    var ulkeler: [String] = [String]()
    
    var sehirler: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Arrayler
        ulkeler = ["Türkiye", "Rusya", "Bulgaristan", "Finlandiya", "Almanya", "Hollanda"]
        
        sehirler = ["Berlin", "Hersinki", "İstanbul", "Roman", "Moskova", "Amsterdam"]
        
        // DataSource ve Delegate bağlantısı
        ulkelerTableView.dataSource = self
        ulkelerTableView.delegate = self
        sehirlerTableView.dataSource = self
        sehirlerTableView.delegate = self
        
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var veriSayisi:Int?
        
        if tableView == sehirlerTableView {
            veriSayisi = sehirler.count
        }else if tableView == ulkelerTableView {
            veriSayisi = ulkeler.count
        }
        return veriSayisi!
    }
    
    //Hücrenin içerisine veri ekleme
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell:UITableViewCell?
        
        if tableView == ulkelerTableView {
            cell = tableView.dequeueReusableCell(withIdentifier: "ulkelerHucre", for: indexPath)
            
            cell?.textLabel?.text = ulkeler[indexPath.row]
            
        }else if tableView == sehirlerTableView {
            cell = tableView.dequeueReusableCell(withIdentifier: "sehirlerHucre", for: indexPath)
            
            cell?.textLabel?.text = sehirler[indexPath.row]
            
        }
        
        return cell!
    }
    // Seçme işlemi
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == sehirlerTableView {
            print("Seçilen Ülke: \(sehirler[indexPath.row])")
        }else if tableView == ulkelerTableView {
            print("Seçilen Ülke: \(ulkeler[indexPath.row])")
        }
        
    }
}
