//
//  ViewController.swift
//  TravelBook
//
//  Created by Hakan Sezer on 20.09.2023.
//

import UIKit
import MapKit
import CoreLocation
import CoreData

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var nameText: UITextField!
    
    @IBOutlet weak var commentText: UITextField!
    
    @IBOutlet weak var mapView: MKMapView!
    // Location için kullanırız. Konumunu alabilmek için kullanırız. Fakat İmport'ta etmek gerek.
    var locationManager = CLLocationManager()
    var chosenLatitude = Double()
    var chosenLongitude = Double()
    
    // Bu ikisini diğer ListViewController üzerinden çekeceğiz.
    var selectedTitle = ""
    var selectedTitleID : UUID?
    
    var annotationTitle = ""
    var annotationSubtitle = ""
    var annotationLatitude = Double()
    var annotationLongitude = Double()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // MKMapViewDelegate
        mapView.delegate = self
        // Location
        locationManager.delegate = self
        // Konumun verisi ne kadar keskinlikle bulunacak.
        // Best çok enerji yer.
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        // Konum'a izin istiyoruz.
        locationManager.requestWhenInUseAuthorization()
        // Kullanıcının yerini bununla almaya başlıyoruz.
        locationManager.startUpdatingLocation()
        
        
        // Ekrana tıklama
        // Bu şekilde fonksiyon yapmak bize gestureRecognizer ulaşması demektir.
        let gestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(chooseLocation(gestureRecognizer:)))
        // Uzun basma saniyesi
        gestureRecognizer.minimumPressDuration = 3
        // Tıklamayı mapView ekledik.
        mapView.addGestureRecognizer(gestureRecognizer)
        
        
        if selectedTitle != "" {
            //CoreData
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Places")
            //Filtre
            // İdleri sadece eşit olanları çağır diyorum.
            let idString = selectedTitleID!.uuidString
            fetchRequest.predicate = NSPredicate(format: "id = %@", idString)
            
            fetchRequest.returnsObjectsAsFaults = false
            
            
            do {
                let results = try context.fetch(fetchRequest)
                
                if results.count > 0 {
                    // NSManageObject Bizim CoreData metodlarına ulaşmamıza olanak sağlıyordu.
                    // Sırasıyla arama yaparak ulaşmamızı sağlıyor.
                    // Bu bizim aramış olduğumuz şeyi bulmamızı sağlıyor fakat hepsi iç içe olacak şekilde sıralı gitmektedir.
                    // Bunlar aynı zamanda Pin eklemek için kullanılmaktadır.
                    for result in results as! [NSManagedObject] {
                        if let title = result.value(forKey: "title") as? String {
                            annotationTitle = title
                            
                            if let subtitle = result.value(forKey: "subtitle") as? String {
                                annotationSubtitle = subtitle
                                
                                if let latitude = result.value(forKey: "latitude") as? Double {
                                    annotationLatitude = latitude
                                    
                                    if let longitude = result.value(forKey: "longitude") as? Double {
                                        annotationLongitude = longitude
                                        
                                        let annotation = MKPointAnnotation()
                                        annotation.title = annotationTitle
                                        annotation.subtitle = annotationSubtitle
                                        // Koordinat oluşturma
                                        let coordinate = CLLocationCoordinate2D(latitude: annotationLatitude, longitude: annotationLongitude)
                                        annotation.coordinate = coordinate
                                        
                                        //Eklemek için
                                        mapView.addAnnotation(annotation)
                                        nameText.text = annotationTitle
                                        commentText.text = annotationSubtitle
                                        
                                        
                                        //Tıkladığımız yere direk o lokasyonu göstermesi için yazılan kod
                                        locationManager.stopUpdatingLocation()
                                        
                                        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                                        let region = MKCoordinateRegion(center: coordinate, span: span)
                                        mapView.setRegion(region, animated: true)
                                        
                                    }
                                }
                            }
                        }
                    }
                }
            }catch {
                print("Error")
            }
            
        }else {
            // Add New Data
        }
        
    }
    
    // Ekrana tıklama Fonksiyonu.
    @objc func chooseLocation(gestureRecognizer: UILongPressGestureRecognizer) {
        // Tıklanılan yerin koordinasyonlarını alıyoruz.
        // gestureRecognizer.state == .began -> Başladıysa eğer.
        if gestureRecognizer.state == .began {
            // Nereye tıklandığını aldık.
            let touchedPoint = gestureRecognizer.location(in: self.mapView)
            // Koordinatları çevir.
            let touchedCoordinates = self.mapView.convert(touchedPoint, toCoordinateFrom: self.mapView)
            //Yukarıdaki değişkene eşitliyoruz.
            chosenLatitude = touchedCoordinates.latitude
            chosenLongitude = touchedCoordinates.longitude
            
            // Pin oluşturma
            let annotation = MKPointAnnotation()
            // Koordinatı aktardı.
            annotation.coordinate = touchedCoordinates
            annotation.title = nameText.text
            annotation.subtitle = commentText.text
            // Haritaya eklemiş olduk.
            self.mapView.addAnnotation(annotation)
        }
    }
    
    // Update edilen güncellenen lokasyonları dizi içerisinde veriyor.
    // Bu Yeri alacağız kullanıcaya yeni yeri göstereceğiz.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // Boş ise title çalışacak yoksa bulunduğu pin gösterecek.
        if selectedTitle == "" {
            // Bunu yaparsak Güncelle Lokasyonu verecektir.
            //locations[0]
            //----------------------------
            // CL Location Enlem ve Boylamları gösterir.
            // Bu sayede kodun içerisine enlem ve boylamlara sıfır olarak alıyoruz.
            // location[0].coordinate -> Bununla koordinatları alıyoruz.
            let location = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
            // Koordinat üzerinde zoom yapmamızı sağlıyoruz.
            let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            // Region ile Location ve Span'i bir arada tutmamızı sağlıyor.
            let region = MKCoordinateRegion(center: location, span: span)
            // Aynı alanda göstermiş oluyoruz. MapView eklemiş oluyoruz.
            mapView.setRegion(region, animated: true)
        }else {
            
        }
    }
    
    // Pin'in Özelleştirilmesi için kullanmış olduğumuz Fonksiyondur.
    // PinView Baştan oluşturuyoruz.
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        // Kullanıcının Yerini gösteren anatasyon
        if annotation is MKUserLocation {
            return nil
        }
        
        
        let reuseID = "myAnnotation"
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseID) as? MKPinAnnotationView
        
        if pinView == nil {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseID)
            // Özelleştirmeye başlıyoruz.
            // Ekstra bilgi gösterme
            pinView?.canShowCallout = true
            // Pin Rengini değiştirme
            pinView?.tintColor = UIColor.black
            
            let button = UIButton(type: UIButton.ButtonType.detailDisclosure)
            // sağ  tarafında göster
            pinView?.rightCalloutAccessoryView = button
            
        }else {
            pinView?.annotation = annotation
        }
        
        return pinView
        
    }
    // Navigasyon üzerine yönlendirme yaparak Konuma gitme.
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        // Bu boş değilse içerisinde seçilmiş bir şeyler vardır demek.
        if selectedTitle != "" {
            //CLLocation
            var requestLocation = CLLocation(latitude: annotationLatitude, longitude: annotationLongitude)
            
            
            // Kordinatlar ve Yerler arasında bağlantı kurmamızı sağlıyor.
            //Navigasyonu açabilmek için kullanıyor.
            CLGeocoder().reverseGeocodeLocation(requestLocation) { placemarks, error in
                //Closure
                // Siz bir işlem yapıyorsunuz sonucunda bir şey verecek.
                if let placemark = placemarks {
                    if placemark.count > 0 {
                        let newPlacemark = MKPlacemark(placemark: placemark[0])
                        // Navigasyonu açabilmek için Map item.
                        let item = MKMapItem(placemark: newPlacemark)
                        item.name = self.annotationTitle
                        // Navigasyon Modelini seçmiş oluyoruz.
                        let launchOptions  = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
                        // Açıyoruz.
                        item.openInMaps(launchOptions: launchOptions)
                    }
                }
            }
        }
    }
    
    
    

    @IBAction func saveButtonCliked(_ sender: Any) {
        // CoreData
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        // Kullanıcnın verilerini kayedeceğimiz yer
        let newPlace = NSEntityDescription.insertNewObject(forEntityName: "Places", into: context)
        
        newPlace.setValue(nameText.text, forKey: "title")
        newPlace.setValue(commentText.text, forKey: "subtitle")
        newPlace.setValue(chosenLatitude, forKey: "latitude")
        newPlace.setValue(chosenLongitude, forKey: "longitude")
        newPlace.setValue(UUID(), forKey: "id")
        
        
        do {
            try context.save()
        }catch {
            print("Error")
        }
        
        NotificationCenter.default.post(name: NSNotification.Name("newPlace"), object: nil)
        //Geri gitmesi için kullanıyoruz.
        navigationController?.popViewController(animated: true)
        
        
        
    }
    

}

