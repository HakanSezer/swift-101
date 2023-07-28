/*:
 ## Uygulama - Fitness Tercihleri
 
 > Bu egzersizler, öğrendiğiniz Swift konularını bir fitness uygulaması geliştirerek pekiştirmenizi sağlayacak!
 
 Fitness takip uygulamanızın, kullanıcıları sürekli olarak motive etmesini istiyorsunuz. Bunun için `adim` adında bir değişken tanımlayın ve tahmini olarak bugün atmış olabileceğiniz adım sayısına eşitleyin. `adimHedefi` adında bir sabit tanımlayın ve 10000'e eşitleyin. Eğer `adimlar`, `adimHedefi` nin yarısından az ise "Yolu yarılamaya çok yaklaştın, biraz daha gayret et!" cümlesini, eğer `adimlar`, `adimHedefi` değişkeninin yarısından fazla ise "Yolu yarıladın, böyle devam et!" cümlesini konsola yazdıracak bir if-else ifadesi yazın.
 
 */
var adim = 2000
let adimHedef = 10_000

adimHedef / 10
adimHedef / 2

if adim < (adimHedef / 10) {
    print("Adim at ve bugün için güzel bir başlangıç yap!")
}else if adim <= (adimHedef / 2) && adim >= (adimHedef / 10) {
    print("Yolu yarılamaya çok yaklaştın, biraz daha gayret et!")
}else if adim >= (adimHedef / 2) {
    print("Yolu Yarıladın, böyle devam et.")
}

/*:
 Şimdi ise eğer `adimlar` değişkeni, `adimHedefi` değişkeninin onda birinden az ise "Adım at ve bugün için güzel bir başlangıç yap!" cümlesini, yarısından az ise "Yolu yarılamaya çok yaklaştın, biraz daha gayret et!" cümlesini, eğer yarısından fazla ise "Yolu yarıladın, böyle devam et!" cümlesini konsola yazdıracak bir if-else-if ifadesi oluşturun.

 */


//: [Önceki](@previous)  |  sayfa 3 / 9  |  [Sonraki: Alıştırma - Boolean Değerleri](@next)
