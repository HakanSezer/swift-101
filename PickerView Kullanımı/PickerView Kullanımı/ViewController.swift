//
//  ViewController.swift
//  PickerView Kullanımı
//
//  Created by Hakan Sezer on 24.08.2023.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    @IBOutlet weak var labelText: UILabel!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    
    
    var ulkeler = [String]()
    
    var secilenUlke: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Ülkelerimiz.
        ulkeler = ["Türkiye", "Japonya" , "Rusya", "İtalya"]

        // Yukarıda yazmış olduğumuz protocol çalıştırır hale getirmiş olduk.
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    //MARK: İçerisinde Kaç Sutun olacak
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    //MARK: İçerisindeki Eleman Sayısı Kaç
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // Eleman sayısı kadar.
        return ulkeler.count
    }
    //MARK: Başlıkları verileri ekleyeceğimiz Metod
    // Sayısı kadar yazdırır, tek tek çalışır.
    // Row bilgisi sayesinde gerekli olan kadar yazdıracaktır.
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ulkeler[row]
    }
    //MARK: Seçtimiz veya tıkladığımız verileri bulmamıza yarıyor.
    /// ROW yazarak seçili olan kadar gösterecektir.
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        labelText.text = ulkeler[row]
        
        secilenUlke = ulkeler[row]
    }
    
    
    
    @IBAction func gosterButton(_ sender: Any) {
        print(secilenUlke!)
        
        
    }
    

}

