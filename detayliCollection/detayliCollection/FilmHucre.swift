//
//  FilmHucre.swift
//  detayliCollection
//
//  Created by Hakan Sezer on 29.08.2023.
//

import UIKit


protocol FilmHucreProtocol {
    func sepeteEkle(indexPath: IndexPath)
}

class FilmHucre: UICollectionViewCell {
    @IBOutlet weak var filmImageView: UIImageView!
    
    @IBOutlet weak var filmAdiLabel: UILabel!
    @IBOutlet weak var filmFiyatLabel: UILabel!
    
    
    //Protocol çalışma
    var hucreProtocol: FilmHucreProtocol?
    var indexPath: IndexPath?
    
    
    @IBAction func sepeteEkleButton(_ sender: Any) {
        
        //Kullancı kişisine tıklanılan satır bilgisini vermiş olacağız. 
        hucreProtocol?.sepeteEkle(indexPath: indexPath!)
    }
    
    
}
