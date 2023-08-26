//
//  ViewController.swift
//  Basic TableView
//
//  Created by Hakan Sezer on 26.08.2023.
//

import UIKit

class ViewController: UIViewController  {
    @IBOutlet weak var tableViewEkran: UITableView!
    
    var ulkeler: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ulkeler = ["Türkiye", "Finlandiya", "Almanya", "İtalya"]
        
        // temsil edilebilmesi için kullanılır.
        tableViewEkran.dataSource = self
        tableViewEkran.delegate = self
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ulkeler.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Hangi hücreye yazılacağını burada belirtmiş oluyoruz.
        let cell = tableViewEkran.dequeueReusableCell(withIdentifier: "hucreAdi", for: indexPath)
        
        //iOS Backup
        /// Yeni güncelleme ile gelen sistemdir.
        if #available(iOS 14.0, *) {
            var content = cell.defaultContentConfiguration()
            content.text = ulkeler[indexPath.row]
            cell.contentConfiguration = content
        }else {
            cell.textLabel?.text = ulkeler[indexPath.row]
        }
         
        return cell
    }
    
    // Seçilen alandır. Bunu bize döndürür.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Seçilen ülke : \(ulkeler[indexPath.row])")
    }
    
    //MARK: Yeni Kodlama.
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let silAction = UIContextualAction(style: .destructive, title: "Sil") {
            (contextualAction, view, boolValue) in
            
            print("\(self.ulkeler[indexPath.row]) yi sil.")
        }
        
        let duzenleAction = UIContextualAction(style: .normal, title: "Düzenle") {
            (contextualAction, view, boolValue) in
            
            print("\(self.ulkeler[indexPath.row]) yi düzelt.")
            
        }
        
        
        return UISwipeActionsConfiguration(actions: [silAction, duzenleAction  ])
    }
    
    
    
    //Bunu ile didSelectRowAt ile seçim sağlayabiliyorduK
    // Bu seçtiğimiz cell yerini silip düzenlememizi sağlıyor sağ kaydırarak yapıyoruz.
    
    //MARK: Eski Kodlama.
    /*
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let silAction = UITableViewRowAction(style: .default, title: "Sil", handler: {
            (action: UITableViewRowAction, indexPath:IndexPath) -> Void in
            
            print("Şunu Sil \(self.ulkeler[indexPath.row]) yi sil.")
        })
        
        let duzenleAction = UITableViewRowAction(style: .normal, title: "Düzenle", handler: {(action: UITableViewRowAction, indexPath: IndexPath) -> Void in
            
            print("Şunu Düzenle \(self.ulkeler[indexPath.row]) yi düzenle.")
            
        })
        
        
        return [silAction, duzenleAction]
        
    }
*/
}
