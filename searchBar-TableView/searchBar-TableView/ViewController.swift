//
//  ViewController.swift
//  searchBar-TableView
//
//  Created by Hakan Sezer on 29.08.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    var ulkeler: [String] = [String]()
    var aramaSonucuUlkeler: [String] = [String]()
    
    var aramaYapiliyorMu = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ulkeler = ["Türkiye", "Almanya", "İtalya", "Finlandiya", "Amerika", "Türkmenistan", "Japonya"]
        
        
        //protocol yapılarını içeri aktarma
        searchBar.delegate = self
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}


//MARK: Extension -> TableView

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    // Satır sayısı
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if aramaYapiliyorMu {
            return aramaSonucuUlkeler.count
        }else {
            return ulkeler.count
        }
    }
    // Kaç Bölüm
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ulkelerHucre", for: indexPath)
        
        if aramaYapiliyorMu {
            cell.textLabel?.text = aramaSonucuUlkeler[indexPath.row]
        }else {
            cell.textLabel?.text = ulkeler[indexPath.row]
        }
        
        return cell
        
    }
    // Tıklanıldığında seçilmesini sağlayacaktır.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if aramaYapiliyorMu {
            print("Seçilen ülke: \(aramaSonucuUlkeler[indexPath.row])")
        }else {
            print("Seçilen ülke: \(ulkeler[indexPath.row])")
        }
    }
}

//MARK: Extension -> SearchBar
extension ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Arama Sonucu: \(searchText)")
        
        // arama yapılmıyordu.
        if searchText == "" {
           aramaYapiliyorMu = false
        }else {
            aramaYapiliyorMu = true
            
            aramaSonucuUlkeler = ulkeler.filter({$0.lowercased().contains(searchText.lowercased())})
        }
        
        //Her çalıştığında tekrardan çalışır.
        tableView.reloadData()
         
    }
    
}
