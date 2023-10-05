//
//  UpdateViewController.swift
//  InstagramClone
//
//  Created by Hakan Sezer on 28.09.2023.
//

import UIKit
import Firebase
import FirebaseStorage
import FirebaseFirestore

class UpdateViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // MARK: - UI Elements
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var actionButton: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // resmin tıklanabiir olmasını sağlıyoruz.
        imageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(chooseImage))
        imageView.addGestureRecognizer(gestureRecognizer)
    }
    
    // Resim seçiyoruz.
    @objc func chooseImage() {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true)
        
        
    }
    // seçtikten sonra bitişini sağlıyoruz
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    // Alerti Otomatiğe almak.
    func makeAlert(titleInput: String, massageInput: String) {
        let alert = UIAlertController(title: titleInput, message: massageInput, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(okButton)
    }
    
    
    @IBAction func saveClicked(_ sender: Any) {
         
        // Nereye kayıt edeceğimizi belirtiyoruz.
        let storage = Storage.storage()
        let storageReference = storage.reference()
        
        // Klasörü seçtik. Seçmeseydik otomatik seçebiliyor.
        let mediaFolder = storageReference.child("media")
        
        // veri çevirme noktası DataImage
        // Data sıkıştırma
        if let data =  imageView.image?.jpegData(compressionQuality: 0.5) {
            // otomatik ID oluşturulması için gereklidir.
            let uuID = UUID().uuidString
            
            // bir alt klasör için Child kullanıyoruz.
            let imageReference = mediaFolder.child("\(uuID).jpg")
            imageReference.putData(data, metadata: nil) { metadata, error in
                if error != nil {
                    self.makeAlert(titleInput: "Error!", massageInput: error?.localizedDescription ?? "Error!")
                }else {
                    imageReference.downloadURL { url, error in
                        if error != nil {
                            
                            // imageURL string haline getiriyor. Böylelikle Storage çekmiş oluyoruz.
                            let imageURL = url?.absoluteString
                            
                            // DATABASE
                            
                            let fireStoreDatabase = Firestore.firestore()
                            
                            var fireStoreReference: DocumentReference? = nil
                            
                            // FieldValue.serverTimestamp() -> Kullanıcı o an bastığında neyse zaman onu bize alıp veriyor.
                            let firestorePost = ["imageURL" : imageURL!, "postedBy" : Auth.auth().currentUser!.email, "postComment" : self.textField.text!, "date" : FieldValue.serverTimestamp(), "likes" : 0]
                            
                            // Bununla içeride collection oluşturuyoruz.
                                fireStoreReference = fireStoreDatabase.collection("Posts").addDocument(data: firestorePost, completion: { error in
                                if error != nil {
                                    self.makeAlert(titleInput: "Error!", massageInput: error?.localizedDescription ?? "Error")
                                }else {
                                    self.imageView.image = UIImage(named: "select.png")
                                    self.textField.text = ""
                                    self.tabBarController?.selectedIndex = 0
                                }
                            })
                            
                            
                        }
                    }
                }
            }
        }
     }
     

}
