/*:
  ## Alıştırma: If ve If-Else İfadeleri
   
  Kaç tane şekeriniz olduğunu sayan ve buna göre ne kadar şanslı olduğunuzu söyleyen bir makine tasarladığınızı düşünün. Aşağıda, `seker` adında ve değeri 0 olan bir değişken bulunuyor. `seker` değeri sıfır ise konsola "Üzgünüm, bugün pek şanslı değilsin." yazdıran bir koşul ifadesi yazın. Konsola ne yazdırıldığını gözlemleyin.
  
  */

var seker = 0
seker = 10
seker = 105
seker = 100

if seker == 0 {
    print("Üzgünüm, bugün pek şanslı değilsin.")
}else if seker <= 100 {
    print("Bugün şansın yerinde!")
}else {
    print("Bugün fazlasıyla şanslısın.")
}

 /*:
  `seker` değeri 10 olacak şekilde güncellendi. Şimdi, değişkenin değeri 0 ise konsola yine "Üzgünüm, bugün pek şanslı değilsin." yazdıran, ancak değilse "Bugün şansın yerinde!" yazdıran bir `if-else` ifadesi yazın. Konsola ne yazdırıldığını gözlemleyin.
  
  */
 



 /*:
  `seker` değeri bu sefer 105 olarak güncellendi. Şimdi ise, değişkenin değeri 0 ise konsola yine "Üzgünüm, bugün pek şanslı değilsin." yazdıran, değer 100'ün altında ise "Bugün şansın yerinde!" yazdıran, değer 100'ün üstünde ise "Bugün fazlasıyla şanslısın!" yazdıran  bir `if-else if` ifadesi yazın. Konsola ne yazdırıldığını gözlemleyin.
  */





//: [Önceki](@previous)  |  sayfa 2 / 9  |  [Sonraki: Uygulama - Fitness Tercihleri](@next)
