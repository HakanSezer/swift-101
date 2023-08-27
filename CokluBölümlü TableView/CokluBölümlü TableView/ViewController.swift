//
//  ViewController.swift
//  CokluBölümlü TableView
//
//  Created by Hakan Sezer on 26.08.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var bolumler = ["Meyveler", "Renkler", "Mevsimler"]
    
    var bolumVerileri = [["Muz","Elma", "Armut" ],["Kırmızı", "Beyaz", "Mavi"],["Yaz","Kış","Sonbahar"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }


}

//MARK: Extension
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    // Count yapmamızın sebebi bölümler içerisinde içerisinde 3 eleman olmasıdır.
    func numberOfSections(in tableView: UITableView) -> Int {
        return bolumler.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //verilere göre hareket ediyor. Yani Section değerine göre hareket etmiş oluyor.
        // Bu section- > Hangi bölüm olduğunu göstermektedir.
        return bolumVerileri[section].count
    }
    
    // Burası Başlıkların oluşmasını sağlamaktadır.
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return bolumler[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Satır Sayısını bulmamız için gerekli olan veridir.
        let cell = tableView.dequeueReusableCell(withIdentifier: "hucreAdi", for: indexPath)
        
        // iç içe olduğu için böyle yazılmıştır. Yani 0'daki 0 bilgi 0'daki 1. bilgi gibi
        cell.textLabel?.text = bolumVerileri[indexPath.section][indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(bolumler[indexPath.section]) bölümünden \(bolumVerileri[indexPath.section][indexPath.row]) seçildi.")
        
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let silAction = UIContextualAction(style: .destructive, title: "Sil") {
            (contextualAction, view, boolValue) in
            
            print("\(self.bolumler[indexPath.section]) bölümünden \(self.bolumVerileri[indexPath.section][indexPath.row]) silindi.")
        }
        
        let duzenleAction = UIContextualAction(style: .normal, title: "Düzenle") {
            (contextualAction, view, boolValue) in
            
            print("\(self.bolumler[indexPath.section]) bölümünden \(self.bolumVerileri[indexPath.section][indexPath.row]) düzenlendi.")
        }
        
        return UISwipeActionsConfiguration(actions: [silAction, duzenleAction])
    }
    
}
