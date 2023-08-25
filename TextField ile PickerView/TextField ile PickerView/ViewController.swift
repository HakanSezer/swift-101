//
//  ViewController.swift
//  TextField ile PickerView
//
//  Created by Hakan Sezer on 25.08.2023.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var textFieldUlke: UITextField!
    
    var pickerView : UIPickerView?
    
    var ulkeler:[String] = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ulkeler = ["Türkiye", "Almanya", "Rusya", "İtalya"]
        
        //Yukarıdaki nesneyi oluşturuyoruz.
        pickerView = UIPickerView()
        
        //pickerView Nesnesini delegate ve dataSource bağlıyoruz.
        pickerView?.delegate = self // PickerView'e ait metodları çalıştırmak için protocole bağlanır.
        pickerView?.dataSource = self // pickerView'e ait metodları çalıştırmak için protocole bağlanır.
        
        //TextField Tıklandığında aktif bi şekilde harekete geçiriyor.
        textFieldUlke.inputView = pickerView  // textField'a tıklanınca pickerView açılır.
        
        //ToolBar
        /// Buttonlar tool bar üzerinde eklenmekte olduğu için bunu oluşturmak zorundayız.
        let toolBar = UIToolbar()
        toolBar.tintColor = .red
        toolBar.sizeToFit() // ToolBar boyutlandırılıyor.
        
        // Tamam Buttonu ekledi
        let tamamButton = UIBarButtonItem(title: "Tamam", style: .plain, target: self, action: #selector(ViewController.tamamTikla))
        
        let boslukButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        
        let iptalButton = UIBarButtonItem(title: "İptal", style: .plain, target: self, action: #selector(self.iptalTikla))
        
        // buttonları toolBar eklemiş oluyoruz.
        toolBar.setItems([iptalButton,boslukButton,tamamButton], animated: true)
        
        // textfield ile çalışabilmesi için pickerView ekler gibi bunuda eklememiz lazım. Bu şekilde.
        textFieldUlke.inputAccessoryView = toolBar
        
        
    }
    // Kaç Sutun olacağını
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // Kaç eleman olduğunu söylüyor. kaç veri var
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ulkeler.count
    }
    // Satır satır verileri yazdırdığımız metod, textfield içerisine yazması için numaraları alıyor.
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ulkeler[row]
    }
    //Seçilen satırın index numarasını veriyor. Text Field içersine yazması gerekiyor.
    // aşağıdaki numaraları da seçtiği için buradan bu numaralara bakıyoruz.
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textFieldUlke.text = ulkeler[row]
    }
    
    
    @objc func tamamTikla() {
        textFieldUlke.text = ""
        textFieldUlke.placeholder = "Ulke Seç"
        view.endEditing(true)
    }
    
    @objc func iptalTikla() {
        view.endEditing(true)
    }
    
    
}

