//
//  FeedViewController.swift
//  InstagramClone
//
//  Created by Hakan Sezer on 28.09.2023.
//

import UIKit
import Firebase
import SDWebImage

class FeedViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var userEmailArray = [String]()
    var userCommentArray = [String]()
    var likeArray = [Int]()
    var userImageArray = [String]()
    var documentIDArray = [String]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        getDataFromFirestore()
    }
    
    func getDataFromFirestore() {
        // Çekmiş olduk
        let fireStoreDatabase = Firestore.firestore()
        
        // Firebase üzerinden data çekerek ürün almayı öğrendik
        // Order ile en yeni geleni en üste eklemiş olacaktır.
        fireStoreDatabase.collection("Posts").order(by: "date", descending: true).addSnapshotListener { snapshot, error in
            if error != nil {
                // ürün yoksa alacağımız error.
                print(error?.localizedDescription)
            }else {
                if snapshot?.isEmpty != true && snapshot != nil {
                    // Arka arkaya aynı cellerin oluşmamasını engellemiş olduk.
                    self.userImageArray.removeAll(keepingCapacity: false)
                    self.userEmailArray.removeAll(keepingCapacity: false)
                    self.userCommentArray.removeAll(keepingCapacity: false)
                    self.likeArray.removeAll(keepingCapacity: false)
                    self.documentIDArray.removeAll(keepingCapacity: false)
                    
                    
                    for document in snapshot!.documents {
                        let documentID = document.documentID
                        print(documentID)
                        // ID çekiyoruz.
                        self.documentIDArray.append(documentID)
                        
                        // Bunların String çevirirek döküman olarak çekmiş olduk.
                        if let postedBy = document.get("postedBy") as? String {
                            self.userEmailArray.append(postedBy)
                        }
                        
                        if let postComment = document.get("postComment") as? String {
                            self.userCommentArray.append(postComment)
                        }
                        if let likes = document.get("likes") as? Int {
                            self.likeArray.append(likes)
                        }
                        
                        if let imageURL = document.get("imageURL") as? String {
                            self.userImageArray.append(imageURL)
                        }
                    }
                    // datayı yenileme.
                    self.tableView.reloadData()
                }

            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FeedCell
        cell.commentLabel.text = userCommentArray[indexPath.row]
        cell.likeLable.text = String(likeArray[indexPath.row])
        cell.userEmailLabel.text = userEmailArray[indexPath.row]
        // SDWebImage çekerek buradan url olarak image çekmeyi görüş olduk.
        cell.userImageView.sd_setImage(with: URL(string: self.userImageArray[indexPath.row]))
        // Document çekiyoruz.
        cell.documentIDLabel.text = documentIDArray[indexPath.row]
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userEmailArray.count
    }
    
    

}
