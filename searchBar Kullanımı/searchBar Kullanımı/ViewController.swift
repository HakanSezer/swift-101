//
//  ViewController.swift
//  searchBar Kullanımı
//
//  Created by Hakan Sezer on 29.08.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        
        searchBar.scopeButtonTitles = ["Birinci", "İkinci"]
    }


}

extension ViewController: UISearchBarDelegate {
    // arama yapıldığı anda sonucu gönden metod var
    // Arama yapıldığı anda sonucu döndüren metod var
    // arama bölgesine ne girildiyse onun üzerinden ilerleme yapılmaktadır.
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Arama Sonuc \(searchText)")
    }
    
    //O butona tıklanıldığında işlemler yapıtıryoruz
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("Cancel Seçildi.")
    }
    // seçilmiş olan elemanı göstermektedir.
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        if selectedScope == 0 {
            print("Birinci Seçildi.")
        }else if selectedScope == 1 {
            print("İkinci Seçildi.")
        }
    }
    
}

