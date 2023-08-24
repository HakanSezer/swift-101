//
//  ViewController.swift
//  Date And Time Picker
//
//  Created by Hakan Sezer on 24.08.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textFieldTarih: UITextField!
    
    @IBOutlet weak var textFieldSaat: UITextField!
    
    // datepicker için değişken
    var datePicker: UIDatePicker?
    
    // timePicker için
    var timePicker: UIDatePicker?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Başlangıç için boş sınıf
        datePicker = UIDatePicker()  // Nesneyi Oluşturduk
        datePicker?.datePickerMode = .date // Türünü seçtik
        
        //MARK: Klasik Görünüme Çevirme
        
        if #available(iOS 13.4, *) {
            datePicker?.preferredDatePickerStyle = .wheels
        }
        
        // TimePicker Çalışması.
        timePicker = UIDatePicker()
        timePicker?.datePickerMode = .time
        
        // MARK: Klasik Görünme Çevirme
        
        if #available(iOS 13.4, *) {
            timePicker?.preferredDatePickerStyle = .wheels
        }
        
        // TextField içerisine koymuş olduk.
        textFieldTarih.inputView = datePicker // TextField tıklanınca açılsın.
        
        // TimePicker TextField konması
        textFieldSaat.inputView = timePicker
        
        // Bir metodu tetikleyerek yazılmasını sağlayacak
        /// valueChanged -> Her değişiklilik olduğunda bu metodu çalıştır diyoruz.
        /// Selector olarak yazıyoruz, daha sonrasında self kendi içinde çalıştırmayı sağlıyoruz.
        /// Target eklemek textfield içerisine eklmek için kullanılıyor.
        ///-----------------------------------------------------------------------------------------
        /// Değişiklikleri algılamak istiyorsak Bu formülü yazıyoruz.
        /// Selector Belirtlediğimiz bir metodu tetikleyebiliyor. Ondan aldığımız bilgiyi yazdırmış oluyoruz.
        datePicker?.addTarget(self, action: #selector(self.tarihGoster(dataPicker:)), for: .valueChanged)
        
        timePicker?.addTarget(self, action: #selector(self.zamanGoster(timePicker:)), for: .valueChanged)
        
        /// Boşluğa tıklayınca Tarih seçme alanı kapatma.
        let dokunmaAlgilama = UITapGestureRecognizer(target: self, action: #selector(self.dokunmaAlgilamaMetod))
        
        view.addGestureRecognizer(dokunmaAlgilama)
        
    }

    // Bu başka bir yerden tetikleniyor.
    @objc func tarihGoster(dataPicker:UIDatePicker) {
        // Bununla birlikte gelen bilgiyi okunablir hale getiriyoruz.
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let alinanTarih = dateFormatter.string(from: dataPicker.date)
        
        textFieldTarih.text = alinanTarih
        
        // bu sayede kullanıldıktan sonra kapanacaktır.
        // seçildikten sonra kapanacaktır.
        // view.endEditing(true)
        
    }
    
    @objc func zamanGoster(timePicker: UIDatePicker) {
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "h:mm"
        let alinanSaat = timeFormatter.string(from: timePicker.date)
        
        textFieldSaat.text = alinanSaat
    }
    
    
    
    
    
    
    
    // Dokununca kapatma metodu
    // tetiklenen metodlarda Objc olmak zorunca
    
    @objc func dokunmaAlgilamaMetod() {
        // bu sayede kullanıldıktan sonra kapanacaktır.
        // seçildikten sonra kapanacaktır.
        view.endEditing(true)
    }

}

