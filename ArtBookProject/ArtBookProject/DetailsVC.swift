//
//  DetailsVC.swift
//  ArtBookProject
//
//  Created by Hakan Sezer on 17.09.2023.
//

import UIKit
import CoreData

class DetailsVC: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // NavigationControllerDelegate Fonksiyonu aslına bakıldığında geri dönme için kullanılmaktadır. İçersine gitmiş olduğumuz resim dosyasından dönemk için kullanılmaktadır.
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var yearText: UITextField!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var artistText: UITextField!
    
    @IBOutlet weak var saveButton: UIButton!
    
    
    
    var chosenPainting = ""
    var chosenPaintingId: UUID?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if chosenPainting != "" {
            // tıklanamaz hale geliyor.
            saveButton.isHidden = false
            
            //CoreData
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Paintings")
            
            // Flitreleme
            let idString = chosenPaintingId?.uuidString
            // Arama yapmasını sağlamaktadır.
            fetchRequest.predicate = NSPredicate(format: "id = %@", idString!)
            fetchRequest.returnsObjectsAsFaults = false
            
            do {
               let results = try context.fetch(fetchRequest)
                
                // Datayı aktarmış olduk.
                if results.count > 0 {
                    for result in results as! [NSManagedObject] {
                        if let name = result.value(forKey: "name") as? String {
                            nameText.text = name
                        }
                        
                        if let artist = result.value(forKey: "artist") as? String {
                            artistText.text = artist
                        }
                        
                        if let year = result.value(forKey: "year") as? Int {
                            yearText.text = String(year)
                        }
                        
                        if let imageData = result.value(forKey: "image") as? Data {
                            let image = UIImage(data: imageData)
                            imageView.image = image
                        }
                    }
                    
                }
            }catch {
                
            }
            
        }else {
            saveButton.isHidden = false
            saveButton.isEnabled = false
            nameText.text = ""
            
        }
        
        
        
        // Bunu sayesinde tıklama ile neler yapabileceğimizi belirlemiş oluyoruz. Hareketleri algılayabilen bir şeydir.
        // Gesture Kode eklemiş oluyoruz.
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        // View içerisine aktarmış oluyoruz.
        view.addGestureRecognizer(gestureRecognizer)
        
        // Kullanıcını görsele tıklamasını sağlamış oluyoruz.
        // Resimi tıklanabilir hale getirmiş olduk.
        imageView.isUserInteractionEnabled = true
        // Gesture oluşturduk.
        let imageTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(selectImage))
        // Kullanılabilir hale getirdik.
        imageView.addGestureRecognizer(imageTapRecognizer)
    }
    @objc func hideKeyboard() {
        // ekran içerisinde yaptığımız değişikliği kapatmayı belirliyoruz.
        view.endEditing(true)
    }
    
    
    
    @objc func selectImage() {
        
        // Galeriye götürmek
        // galeriye ulaşmak için kullanılıyor.
        let picker = UIImagePickerController()
        // Fotoğraflarını erişebilmek ve çağırmak için
        picker.delegate = self
        // Fotoğrafın nereden seçileceği
        picker.sourceType = .photoLibrary
        // Editlensin mi fotoğraf
        picker.allowsEditing = true
        // Alertleri buradan gösteriyoruz onu mantığı
        present(picker, animated: true)
        
    }
    // İşi bittikten sonra ne olacağını için kullanacağız.
    // Media ile işimiz bitince kullanılan kod.
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // Uı image çevirmiş oluyoruz
        imageView.image = info[.originalImage] as? UIImage
        // Resim seçildikten sonra tıklanabilir olsun.
        saveButton.isEnabled = true
        // Açtığımızda kapatmak için kullanılır.
        self.dismiss(animated: true)
    }
    
    @IBAction func saveButtonClicked(_ sender: Any) {
        
        // Standart bi kod CoreData için
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        // Bununla CoreData içerisinde oluşturduğumuz sisteme kayıt yaptırmış oluyoruz.
        let newPainting = NSEntityDescription.insertNewObject(forEntityName: "Paintings", into: context)
        
        // Attributes
        newPainting.setValue(nameText.text!, forKey: "name")
        newPainting.setValue(artistText.text!, forKey: "artist")
        
        if let year = Int(yearText.text!) {
            newPainting.setValue(year, forKey: "year")
        }
        
        // UUID otomatik id oluşturmasını sağlamaktadır.
        newPainting.setValue(UUID(), forKey: "id")
        
        // datayı küçüktmek için yapılmaktadır.
        let data = imageView.image?.jpegData(compressionQuality: 0.5)
        
        newPainting.setValue(data, forKey: "image")
        
        do {
            try context.save()
        }catch {
            print("Error.")
        }
        
        // Kayıt olan gözlemciler için mesaj yollamımıız sağlıyor
        NotificationCenter.default.post(name: NSNotification.Name("newData"), object: nil)
        self.navigationController?.popViewController(animated: true)
    }
    

}
