//
//  ViewController.swift
//  SimpsonBook
//
//  Created by Hakan Sezer on 15.09.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    
    var mySimpsons = [SimpsonClass]()
    // 1. Oluşturma
    var chosenSimpson : SimpsonClass?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        let homer = SimpsonClass(nameSimpson: "Homer Simpson", ageSimpson: 20, jobsSimpson: .Enginerr, imageSimpson: UIImage(named: "Homer")!)
        let marge = SimpsonClass(nameSimpson: "Marge Simpson", ageSimpson: 20, jobsSimpson: .Enginerr, imageSimpson: UIImage(named: "Maggie")!)
        let Lisa = SimpsonClass(nameSimpson: "Lisa Simpson", ageSimpson: 20, jobsSimpson: .CoffeeMaker, imageSimpson: UIImage(named: "Lisa")!)
        let Maggie = SimpsonClass(nameSimpson: "Maggie Simpson", ageSimpson: 20, jobsSimpson: .Enginerr, imageSimpson: UIImage(named: "Maggie")!)
        mySimpsons.append(homer)
        mySimpsons.append(marge)
        mySimpsons.append(Lisa)
        mySimpsons.append(Maggie)
    }
    // sayfa içerisine aktarmayı sağlıyoruz.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            // if içerisi doğruysa Bu ViewController gitmesini söylüyoruz.
            let destinationVC = segue.destination as? DetailsVC
            // 3. Oluşturma
            // Burada oluşturmuş olduğumuz chosenSimpson bilgilerini içeriye aktarmayı sağlıyoruz. Böyle
            destinationVC?.selectedSimspon = chosenSimpson
            
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // içeride ne kadar dosya olup olmadığı konusunu belirtmiş olduğumuz yerdir.
        return mySimpsons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let simpSon = mySimpsons[indexPath.row]
        // burada ilk olarak cell hücresini oluşturmuş oluyoruz.
        let cell = UITableViewCell()
        // Cell üzerinden içeriğe aktarılması sağlanacaktır.
        var context = cell.defaultContentConfiguration()
        // içerisindeki hücrede ne yazacağını bile belirtmiş oluyoruz.
        context.text = simpSon.nameSimpson
        // Yazılmış olan text değerini içeriye götürür.
        cell.contentConfiguration = context
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 2. Oluşturma
        chosenSimpson = mySimpsons[indexPath.row]
        // Sayfaya geçiş yapmasını sağlıyoruz.
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
}

//MARK: - İş sarılaması.
/// Bu alanda il olarak tableViewCelleleri gösterek başlamış olduk.
/// Daha sonrasında nasıl ilerleme yapacağımızı belirledik.
/// Sonrasında, TableView bağladık.
///


