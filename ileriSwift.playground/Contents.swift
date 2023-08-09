import UIKit

//MARK: Guard
/// if'in tersi bir yapıda çalışmaktadır.
/// if gibi koşula göre işlem yapar
/// Koşulumuz false ise çalışmaya başlar.
/// return veya throw ifade ile kullanılır. Bundan dolayı genelde Func içerisinde yer alır.
func kisiTanimi(ad:String){
    if ad == "Hakan" {
        print("Merhaba Hakan")
    }else {
        print("Tanınmayan kişi")
    }
}

kisiTanimi(ad: "Hakan")



func kisiTanimi1(ad:String){
    guard ad == "Mehmet" else {
        print("Tanınmayan kişi")
        // bir sorun olduğu zaman kodun çalışmasını engelleyecek olan kısımdır.
        return
    }
    print("Merhaba Mehmet")
}

kisiTanimi1(ad: "Mehmet")


// Optional ifade

func buyukHarfYap(str:String?) {
    // buradaki temp yazısı bizim belirlemiş olduğumu bir değişkendir.
    guard let temp = str , temp.count > 0 else {
        print("Str nil'dir.")
        return
    }
    print(temp.uppercased())
}

buyukHarfYap(str: "Hakan")



//MARK: Do Try Catch - EXCEPTION

enum Hatalar: Error {
    case sifiraBolunmeHatasi
}

// throws otomatik hata fırlatmasını sağlayan bir yapıdır. Bu yapı sayesinde nerede hata olduğunu anlayabilmiş oluyor.
func bolme(s1: Int , s2: Int) throws -> Int {
    // Hata olduğu durum için yazılmış olan kod satarı bu şekildedir.
    if s2 == 0 {
        throw Hatalar.sifiraBolunmeHatasi
    }
    return s1 / s2
}

var s1 = 10
var s2 = 5

/// Eğer s2 0 olursa bu yapıya Fatal Error gelmiş olacaktır.
print(s1 / s2)

// throws durumunda hata fırtalama olasığı olduğu için bu yüzden direk bu şekilde konu yazamayız.
/// let sonuc = bolme(s1: 10, s2: 5)


/// Do - Catch ile yapılan taraf.
/*
do {
    let sonuc = try bolme(s1: s1, s2: s2)
    print(sonuc)
}catch Hatalar.sifiraBolunmeHatasi {
    print("Sayı sıfıra bölünemez.")
}
*/

/// Try ile yapılan taraf
/// Genel tavsiye budur.

let sonuc = try? bolme(s1: s1, s2: s2)

if sonuc == nil  {
    print("Hata oluşutuğu için sonuç nil olmuştur.")
}else {
    print("Hata yok \(sonuc!)")
}




//MARK: Thread(Öncelikleri belirtir.)
/// Threadlerin öncelik sıraları bulunmaktadır. Bu sıralama ile hangisinin önce biteceğini belirmemiş oluruz.
/// İlk başta bütün kodlar çalışmaya başlar fakat bitiş sırası farklıdır.

let queue = DispatchQueue(label: "etiket" , qos: DispatchQoS.userInitiated)
let queue1 = DispatchQueue(label: "etiket2" , qos: DispatchQoS.userInitiated)

queue.async {
    for i in 1...10 {
        print("A: \(i)")
    }
}


queue1.async {
    for i in 100...110 {
        print("B: \(i)")
    }
}


// Thread Delay

///DispatchTimeInterval sayesinde geçikme ekleyebiliyoruz.
var gecikmeSaniye: DispatchTimeInterval = .seconds(2)
print(Date())

// burada kodun başlangıç zamanın da geçime eklemiş oluyoruz.
queue1.asyncAfter(deadline: .now()+gecikmeSaniye) {
    print(Date())
}
