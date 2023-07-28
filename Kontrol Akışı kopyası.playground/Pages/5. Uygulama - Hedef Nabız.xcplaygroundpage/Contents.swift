/*:
 ## Uygulama - Hedef Nabız
 
 Fitness takip uygulamanızın, kullanıcılarınızı spor yaptıkları esnada belirli bir nabız aralığı içerisinde kalmalarına yardımcı olan bir özellik eklemeye karar verdiniz. Bunun için:
 
`hedefinAltinda` ve `hedefinUzerinde` adlarına sahip 2 adet sabit oluşturun. Bu sabitlerin değerlerini, `guncelKalpAtisHizi` değişkenini hedef sınırları ile kıyaslayan karşılaştırma ifadelerine eşitleyin.
 
 Kullanıcının kalp atış hızı hedeflenen limitin içerisinde ise "Doğru tempodasın!", hedeflenen aralığın altında ise "İyi gidiyorsun ancak temponu artırmalısın!", hedeflenen aralığın üzerinde ise "Tempon çok yüksek! Biraz yavaşlamaya çalış." cümlesini biraz önce oluşturduğunuz sabitleri kullanan bir `if-else if` ifadesi ile konsola yazdırın.
 
 */
var guncelKalpAtisHizi = 100
let hedefinAltinda = 60
let hedefinUzerinde = 90

if guncelKalpAtisHizi >= hedefinAltinda && guncelKalpAtisHizi <= hedefinUzerinde {
    print("Doğru tempodasın.")
}else if guncelKalpAtisHizi <= hedefinUzerinde && guncelKalpAtisHizi <= hedefinAltinda {
    print("İyi gidiyorsun ancak temponu artırmalısın!")
}else {
    print("Tempon çok yüksek! Biraz yavaşlaya çalış.")
}




//: [Önceki](@previous)  |  sayfa 5 / 9  |  [Sonraki: Alıştırma - Switch İfadeleri](@next)
