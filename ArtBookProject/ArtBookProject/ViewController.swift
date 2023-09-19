//
//  ViewController.swift
//  ArtBookProject
//
//  Created by Hakan Sezer on 16.09.2023.
//

import UIKit
import CoreData

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var nameArray = [String]()
    var idArray = [UUID]()
    var selectedPainting = ""
    var selectedPaintingId: UUID?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        //
        getData()
        
        
        //MARK: Kod ile BarButton oluşturmak.
        // Bu kod ile bar button oluşturmuş oluyoruz. Böylelikle Her şey daha rahat olmuş oluyor.
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonClicked))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(getData), name: NSNotification.Name("newData"), object: nil)
    }
    
    @objc func getData() {
        // Datayı arka arkaya çekmemesi için kullanılır.
        nameArray.removeAll(keepingCapacity: false)
        idArray.removeAll(keepingCapacity: false)
        
        
        
        // AppDelegate üzerinden oluşturmuş olduğumuz CoreData çekiyoruz.
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        // Fetch- Tut getir. Dataları çekmek için kullanıyoruz.
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Paintings")
        // Arka taraftaki okumaları daha rahat okuması için kullanıyoruz.
        fetchRequest.returnsObjectsAsFaults = false
        
        
        do {
            //Bu bir dizi olmasına sebep oldu.
            let results = try context.fetch(fetchRequest)
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    // Bunu vermekle birlikte isme ulaşabileceğiz
                    if let name = result.value(forKey: "name") as? String {
                        self.nameArray.append(name)
                    }
                    
                    if let id = result.value(forKey: "id") as? UUID {
                        self.idArray.append(id)
                    }
                    // Yenileme sağlayacak.
                    self.tableView.reloadData()
                }
            }
        }catch {
            print("Error")
        }
        
        
    }
    
    
    
    
    
    
    
    // Action bölümünü kullanabilmek için bu bölümü yazıyoruz.
    @objc func addButtonClicked() {
        // + ya mı tıklandı yoksa seçili olan dosya mı tıklandı belirlemiş oluyoruz.
        selectedPainting = ""
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = nameArray[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsVC
            // veri aktarmış oluyoruz.
            destinationVC.chosenPainting = selectedPainting
            destinationVC.chosenPaintingId = selectedPaintingId
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Bunu yaparak aslında bakılırsa gerçekten + tıklanıp tıklanmadığını belirlemiş oluyoruz.
        
        
        selectedPainting = nameArray[indexPath.row]
        selectedPaintingId = idArray[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            // veri çekmek için kullanılır.
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Paintigs")
            
            // ID çekmiş oluyoruz.
            let idString = idArray[indexPath.row].uuidString
            
            // ID arama işemine sokmuş oluyoruz.
            fetchRequest.predicate = NSPredicate(format: "id = %@", idString)
            
            fetchRequest.returnsObjectsAsFaults = false
            
            
            do {
                let results = try context.fetch(fetchRequest)
                if results.count > 0 {
                    for result in results as! [NSManagedObject] {
                        if let id = result.value(forKey: "id") as? UUID {
                            
                            if id == idArray[indexPath.row] {
                                // coredata'dan siliyor.
                                context.delete(result)
                                nameArray.remove(at: indexPath.row)
                                idArray.remove(at: indexPath.row)
                                self.tableView.reloadData()
                                
                                do {
                                    
                                    
                                  try context.save()
                                }catch {
                                    
                                }
                                // İşlemi tamamen bitirmek için kullanacağız.
                                break
                            }
                        }
                    }
                }
                
                
            }catch {
                
            }
            
            
            
            
            
        }
    }
}

