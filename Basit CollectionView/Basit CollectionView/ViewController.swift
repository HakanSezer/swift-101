//
//  ViewController.swift
//  Basit CollectionView
//
//  Created by Hakan Sezer on 28.08.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var ulkeler:[String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: Boyut Hesapları
        // tasarıma başlamadan önce oluşturulması gerekmektedir.
        //TASARIM TANITIMI
        let tasarim: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        // Ekran genişliği kodudur.
        //EKRAN GENİŞLİĞİ
        let genislik = self.collectionView.frame.size.width
        
        // Köşe aralıkları
        //HUCRELERİN EKRANA YAKIN OLAN KENARLARININ UZAKLIĞI
        tasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        // BOSLUKLAR HARİCİNDE KALAN ALANA 3 ADET HUCRELERİ YERLEŞTİRİRİZ.
        tasarim.itemSize = CGSize(width: (genislik - 30)/3, height: (genislik - 30)/3)
        
        // Aralıkları belirlemiş olduk.
        // YATAY HUCRELER ARASI BOSLUK
        tasarim.minimumLineSpacing = 4
        //DIKEY HUCRELER ARASI BOSLUK
        tasarim.minimumLineSpacing = 4
        
        // LAYOUT UYGULANMASI
        collectionView!.collectionViewLayout = tasarim
        
        ulkeler = ["Türkiye", "Almanya", "İtalya", "Rusya","Güney Kore", "Fransa", "Mısır" ,"Amerika", "Kıbrıs"]
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ulkeler.count
    }
    
    //Toplan Kaç veri var buradan öğrenmiş oluyor.
    // O saydığın satır numarasını buradan kullanıyor.
    // Arayüzümdeki verileri yerleştirme Metodu'dur.
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ulkeHucre", for: indexPath) as! CollectionViewHucre
        
        cell.hucreLabel.text = ulkeler[indexPath.row]
        
        // renk değiştirme oluşturuyoruz.
        cell.layer.borderColor = UIColor.blue.cgColor
        cell.layer.borderWidth = 0.5
        
        return cell
    }
    // Tıklama Özelliği
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Seçilen Ulkeler :\(ulkeler[indexPath.row])")
    }
    
}
