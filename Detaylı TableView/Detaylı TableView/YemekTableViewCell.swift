//
//  YemekTableViewCell.swift
//  Detaylı TableView
//
//  Created by Hakan Sezer on 28.08.2023.
//

import UIKit

protocol YemekTableViewCellProtocol {
    func siparisVer(indexPath: IndexPath)
}



class YemekTableViewCell: UITableViewCell {
    @IBOutlet weak var yemekResimImageView: UIImageView!
    
    @IBOutlet weak var labelYemekFiyati: UILabel!
    @IBOutlet weak var labelYemekAdi: UILabel!
    
    //bir Nesne
    
    var hucreProtocol: YemekTableViewCellProtocol?
    var indexPath: IndexPath?
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func siparisVerButton(_ sender: Any) {
        
        // Bu tanıtmış olduğumuz indexPatch bizim yukarıda oluşturmuş olduğumuz indexPath'tir.
        //var indexPath: IndexPath? -> bundan gelir.
        hucreProtocol?.siparisVer(indexPath: indexPath!)
        
    }
    
}
