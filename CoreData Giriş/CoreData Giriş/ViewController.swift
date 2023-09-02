//
//  ViewController.swift
//  CoreData Giriş
//
//  Created by Hakan Sezer on 2.09.2023.
//

import UIKit
import CoreData

// çoğu işlemi bunla yapıyoruz.
// Global olması lazım.
// Her yerden erişilmesi gerekiyor.
let appDelegate = UIApplication.shared.delegate as! AppDelegate

class ViewController: UIViewController {
    // her sınıfta olması lazım veri kaydında veri okumada gerekiyor
    let context = appDelegate.persistentContainer.viewContext
    
    var kisilerListe = [Kisiler]()

    override func viewDidLoad() {
        super.viewDidLoad()
        //veriKaydi()
        veriFiltreleme()
        
        //veriSilme()
        
        
    }
    
    func veriKaydi() {
        let kisi = Kisiler(context: context)
        
        kisi.kisi_Ad = "Ece"
        kisi.kisi_Yas = 35
        
        // Bununla birlikte kayıt etmiş olduk.
        appDelegate.saveContext()
    }
    
    
    func veriOkuma() {
        do {
            // Kisiler.fetchRequest() -> bu yapı ile istek göndermiş oluyoruz.
            // Hangisinden veri çekeceğimizi yazmış oluyoruz.
            
            kisilerListe = try context.fetch(Kisiler.fetchRequest())
        }catch {
            print("Veri Okurken Hata Oluştu.")
        }
        
        for k in kisilerListe {
            print("Ad: \(k.kisi_Ad!) - Yaş: \(k.kisi_Yas)")
        }
        
    }
    
    
    func veriOkumaSiralama() {
        //Bu işlemi yapmak için coredata import edilmelidir.
        let fetchRequest: NSFetchRequest<Kisiler> = Kisiler.fetchRequest()
        
        // Hangi alan üzerinde sıralama yapıcağımızı belirtiyoruz.
        // Neye göre sırılama yapacağacağımıızı belirliyoruz.
        // ascending -> True ile küçükten büyüğe FALSE ile büyükten küçüye doğru sıralama yapılacaktır.
        let sort = NSSortDescriptor(key: #keyPath(Kisiler.kisi_Yas), ascending: false)
        
        //Sıralama fetchRequest nesnesine eklenir.
        fetchRequest.sortDescriptors = [sort]
        
        
        do {
            // Kisiler.fetchRequest() -> bu yapı ile istek göndermiş oluyoruz.
            // Hangisinden veri çekeceğimizi yazmış oluyoruz.
            // Yeni fetchRequest nesnesi ile veri alırken sıralama değişir.
            kisilerListe = try context.fetch(fetchRequest)
        }catch {
            print("Veri Okurken Hata Oluştu.")
        }
        // Veri gösterme
        for k in kisilerListe {
            print("Ad: \(k.kisi_Ad!) - Yaş: \(k.kisi_Yas)")
        }
        
    }
    
    func veriFiltreleme() {
        //Bu işlemi yapmak için coredata import edilmelidir.
        let fetchRequest: NSFetchRequest<Kisiler> = Kisiler.fetchRequest()
        
        fetchRequest.predicate = NSPredicate(format: "kisi_yas > %i", 20)
        
        do {
            // Kisiler.fetchRequest() -> bu yapı ile istek göndermiş oluyoruz.
            // Hangisinden veri çekeceğimizi yazmış oluyoruz.
            // Yeni fetchRequest nesnesi ile veri alırken sıralama değişir.
            kisilerListe = try context.fetch(fetchRequest)
        }catch {
            print("Veri Okurken Hata Oluştu.")
        }
        // Veri gösterme
        for k in kisilerListe {
            print("Ad: \(k.kisi_Ad!) - Yaş: \(k.kisi_Yas)")
        }
    }
    
    
    /*
     @ = String i = integer
     ilk bu oluşturulacak
     let fetchRequest: NSFetchRequest<Kisiler> = Kisiler.fetchRequest()
     
     // Sorgu oluşturulur .kisi yası 26 eşitse
     fetchRequest.predicate = NSPredicate(format: "kisi_yas == i%, 26)
     
     // kisinin adı ahmet'e eşitse
     fetchRequest.predicate = NSPredicate(format: "kisi_yas == %@", "ahmet")
     
     //kisinin yası 18'den büyükse
     fetchRequest.predicate = NSPredicate(format: "kisi_yas > i%, 18)
     
     
     // kişinin adı ahmet'e eşitse
     fetchRequest.predicate = NSPredicate(format: "%K == %i,"kisi_ad", "ahmet")
     
     
     //kişinin adı a harfini içeriyorsa
     fetchRequest.predicate = NSPredicate(format: "kisi_ad CONTAINS %@, "a")
     
     //iki şart kullanılabilir.
     fetchRequest.predicate = NSPredicate(format: "kisiler_is.is_ad == %@, "spor")
     
     //ilişkisi olduğu tablodan sorgu olabilir.
     // composition yaparak eşirim sağlanır.
     fetchRequest.predicate = NSPredicate(format: "kisiler_is.is_ad == %@, "spor")
     */
    
    
    func veriSilme() {
        
        let kisi = kisilerListe[1]
        
        context.delete(kisi)
        
        appDelegate.saveContext()
    }
    
    func veriGuncelle() {
        let kisi = kisilerListe[1]
        
        kisi.kisi_Ad = "Yeni Ece"
        kisi.kisi_Yas = 99
        
        appDelegate.saveContext()
    }


}

