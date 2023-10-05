//
//  FeedCell.swift
//  InstagramClone
//
//  Created by Hakan Sezer on 5.10.2023.
//

import UIKit
import Firebase

class FeedCell: UITableViewCell {
    @IBOutlet weak var userEmailLabel: UILabel!
    
    @IBOutlet weak var documentIDLabel: UILabel!
    @IBOutlet weak var likeLable: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var commentLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func likeButton(_ sender: Any) {
        let fireStoreDatabase = Firestore.firestore()
        if let likeCount = Int(likeLable.text!) {
            let likeStore = ["likes" : likeCount + 1] as [String: Any]
            
            // SetData ile Firebase üzerinde her şeyi güncelleme sadece sana vermiş olduğum datayı güncelleme demektir.
            fireStoreDatabase.collection("Posts").document(documentIDLabel.text!).setData(likeStore, merge: true)
        }
        
        // Tıklanılan postun değerini almış olacağız.
        
    }
    
}
