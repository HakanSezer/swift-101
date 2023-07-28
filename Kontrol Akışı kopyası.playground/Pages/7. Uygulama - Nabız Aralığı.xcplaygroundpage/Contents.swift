/*:
 ## Uygulama - Nabız Aralığı
  
 Hedef Nabız egzersizinde kullanıcıya nabzının belirlenen limitler içerisinde olmasına göre farklı mesajlar gösterdiniz. Şimdi ise kullanıcınızın nabız aralığına göre hangi bölgede bulunduklarını belirtin.
 
 Kullanıcının `guncelKalpAtisHizi`nın denk geldiği aralığa göre aşağıdaki cümlelerden birini konsola yazdırın:
 
 - 100-120:  "Çok Hafif bölgedesiniz. Bu bölgedeki aktivite, iyileşmeye yardım eder."
 - 121-140:  "Hafif bölgedesiniz. Bu bölgedeki aktivite, vücut dayanıklılığını ve yağ yakımını geliştirmeye yardımcı olur."
 - 141-160:  "Orta bölgedesiniz. Bu bölgedeki aktivite, aerobik fitnessın iyileştirilmesine yardımcı olur."
 - 161-180:  "Zorlu bölgedesiniz. Bu bölgedeki aktivite, daha kısa egzersizler için maksimum performans kapasitesini artırır."
 - 181-200:  "Çok Zorlu bölgedesiniz. Bu bölgedeki aktivite, sporcuların hızlarını geliştirmelerine yardımcı olur."
 
 Eğer `guncelKalpAtisHizi` yukarıdaki listedeki aralıkların üstünde ise konsola kullanıcının yavaşlamasını söyleyen bir uyarı yazdırın.
 */
let heartRate = 200

switch heartRate {
case 100...120:
    print("Çok Hafif bölgedesiniz. Bu bölgedeki aktivite, iyileşmeye yardım eder.")
case 121...140:
    print("Hafif bölgedesiniz. Bu bölgedeki aktivite vücut dayanıklılığını ve yağ yakımını geliştirmeye yardımcı olur.")
case 141...160:
    print("Orta bölgedesiniz. Bu bölgedeki aktivite aerobik fitnessın iyileştirilmesine yadımcı olur.")
case 161...180:
    print("Zorlu bölgdesiniz. Bu bölgedeki aktivite daha kısa egzersizler için maksimum performans kapasitesine artırır.")
case 181...200:
    print("Çok zorlu bölgdesiniz. Bu bölgedeki aktivite, sporcuların hızlarını geliştirmelerine yardımcı olur.")
default:
    break
}
 

//: [Önceki](@previous)  |  sayfa 7 / 9  |  [Sonraki: Alıştırma - Ternary Operatör](@next)
