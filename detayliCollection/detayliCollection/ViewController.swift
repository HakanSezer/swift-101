//
//  ViewController.swift
//  detayliCollection
//
//  Created by Hakan Sezer on 29.08.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var filmCollectionView: UICollectionView!
    
    
    var filmlerListesi = [Filmler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Tasarim
        let tasarim: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        let genislik = self.filmCollectionView.frame.size.width
        
        tasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        tasarim.minimumInteritemSpacing = 6
        tasarim.minimumLineSpacing = 6
        
        let hucreGenislik = (genislik-20)/2
        
        tasarim.itemSize = CGSize(width: hucreGenislik, height: hucreGenislik*1.6)
        
        //bununla bağlamış olduk.
        filmCollectionView!.collectionViewLayout = tasarim
        
        
        
        //Protocol Bağlantı
        filmCollectionView.dataSource = self
        filmCollectionView.delegate = self
        
        // Oluşturulmuş Filmler
        let f1 = Filmler(filmId: 1, filmBaslık: "Django", filmResimAdi: "django", filmFiyat: 15.99)
        let f2 = Filmler(filmId: 2, filmBaslık: "Inception", filmResimAdi: "inception", filmFiyat: 15.99)
        let f3 = Filmler(filmId: 3, filmBaslık: "Interstellar", filmResimAdi: "interstellar", filmFiyat: 15.99)
        let f4 = Filmler(filmId: 4, filmBaslık: "Anadoluda", filmResimAdi: "birzamanlaranadoluda", filmFiyat: 15.99)
        let f5 = Filmler(filmId: 5, filmBaslık: "The Hateful Eight", filmResimAdi: "thehatefuleight", filmFiyat: 15.99)
        let f6 = Filmler(filmId: 6, filmBaslık: "The Pianist", filmResimAdi: "thepianist", filmFiyat: 15.99)
        
        // Eklenmiş Filmler
        filmlerListesi.append(f1)
        filmlerListesi.append(f2)
        filmlerListesi.append(f3)
        filmlerListesi.append(f4)
        filmlerListesi.append(f5)
        filmlerListesi.append(f6)
    }
    
}


//MARK: Extension

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource,FilmHucreProtocol {
    // Bu butonu tıklandığında bize aktarılabilemesi için açılmıştır.
    
    // Bu kodun çalışabilmesi için cellForItemAt içerisinde bulunan
    ///cell.hucreProtocol = self
    ///cell.indexPath = indexPath
    ///Bunlar yazılmalıdır.
    func sepeteEkle(indexPath: IndexPath) {
        let film = filmlerListesi[indexPath.row]
        
        print("\(film.filmBaslık!) film sipariş verildi.")
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // Kaçta veri olacak
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filmlerListesi.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let film = filmlerListesi[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "filmHucre", for: indexPath) as! FilmHucre
        cell.filmAdiLabel.text = film.filmBaslık!
        cell.filmFiyatLabel.text = "\(film.filmFiyat!) TL"
        cell.filmImageView.image = UIImage(named: film.filmResimAdi!)
        
        // Bu sepeteEkle Func çalışabilmesi için oluşturulmuştur.
        cell.hucreProtocol = self
        cell.indexPath = indexPath
        
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.5
        
        return cell
    }
    // İmageView tıklayarak seçme işlemi yapıldığında bu çalışır.
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let film = filmlerListesi[indexPath.row]
        
        print("\(film.filmBaslık!) film seçildi.")
    }
    
}
