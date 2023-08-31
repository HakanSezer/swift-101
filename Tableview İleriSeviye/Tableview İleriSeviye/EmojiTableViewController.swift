//
//  EmojiTableViewController.swift
//  Tableview İleriSeviye
//
//  Created by Hakan Sezer on 31.08.2023.
//

import UIKit
// UITableViewDataSource && UITableViewDelegate içerisinde bulunuyor.
class EmojiTableViewController: UITableViewController {
    
    //MARK: - Properties
    var emojis: [Emoji] = [
        Emoji(symbol: "😀", name: "Grinning Face",
              description: "A typical smiley face.", usage: "happiness"),
        Emoji(symbol: "😕", name: "Confused Face",
              description: "A confused, puzzled face.", usage: "unsure what to think; displeasure"),
        Emoji(symbol: "😍", name: "Heart Eyes",
              description: "A smiley face with hearts for eyes.",
              usage: "love of something; attractive"),
        Emoji(symbol: "👮", name: "Police Officer",
              description: "A police officer wearing a blue cap with a gold badge.",
              usage: "person of authority"),
        Emoji(symbol: "🐢", name: "Turtle",
              description: "A cute turtle.",
              usage: "Something slow"),
        Emoji(symbol: "🐘", name: "Elephant",
              description: "A gray elephant.",
              usage: "good memory"),
        Emoji(symbol: "🍝", name: "Spaghetti",
              description: "A plate of spaghetti.",
              usage: "spaghetti"),
        Emoji(symbol: "🎲", name: "Die",
              description: "A single die.",
              usage: "taking a risk, chance; game"),
        Emoji(symbol: "⛺️", name: "Tent",
              description: "A small tent.",
              usage: "camping"),
        Emoji(symbol: "📚", name: "Stack of Books",
              description: "Three colored books stacked on each other.",
              usage: "homework, studying"),
        Emoji(symbol: "💔", name: "Broken Heart",
              description: "A red, broken heart.",
              usage: "extreme sadness"),
        Emoji(symbol: "💤", name: "Snore",
              description: "Three blue \'z\'s.",
              usage: "tired, sleepiness"),
        Emoji(symbol: "🏁", name: "Checkered Flag",
              description: "A black-and-white checkered flag.",
              usage: "completion")
    ]

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEditEmoji" {
            //O an seçili olan hücrenin IndexPath Değerini verir.
            let selectedIndexPath = tableView.indexPathForSelectedRow!
            
            let selectedEmoji = emojis[selectedIndexPath.row]
            
            // Segue'in Storyboard'da bağlı olduğu yer bir NavigationController
            let dest = segue.destination as! UINavigationController
            
            // NavigationController topViewController(kendisine bağlı olan ilk sayfa ulaşılır.)
            let editEmojiController = dest.topViewController as!  NewEmojiTableViewController
            
            // Gidilecek sayfada bulunan "emoji" değişkenini doldurur.
            editEmojiController.emoji = selectedEmoji
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // 1 Section varsa bu fonksiyonu yazmak zorunda değilsiniz.
        // Çünkü: varsayılan section sayısı zaten 1'dir.
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Her section için 1 kez çalışıyor. Örneğin, 4 section'a sahip tableView varsa,
        // Bu fonksiyon her section için 1 kez olmak üzere toplam 4 kez çalışacaktır.
        // Section parametresi, o an çizilmekte olan section bilgisini verir.
        return emojis.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // bir hücre, ne zamanki erkana gelecek cellForRow ile çizilir.
        // Bu fonksiyonun kaç kere çalışacağı belli değildir.
        // örnek 1: Kullanıcı hiç scrool etmez ise ekranda görünebilir olan hücre sayısı kadar çalılır.
        
        // indexPath: O an çizilmekte olan hücrenin konum bilgisi.
        // 1. Adım O an çizilmekte olan emoji nesnesini indexPath değeri ile ulaşmak.
        let emoji = emojis[indexPath.row]
        
        // Adım2: Hücre oluşturmak.
        // reuseIdentifier: Stoyboard'da hücre için verdiğiniz identifier değeri.
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmojiCell") as! EmojiTableViewCell
        
        // Adim 3: Hücreyi data ile doldurmak.
        
        cell.update(with: emoji)
        /*
        cell.textLabel?.text = "\(emoji.symbol) - \(emoji.name)"
        cell.detailTextLabel?.text = emoji.description // Subtitle
        */
        return cell
    }

   
    // MARK: - TableView Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Bu fonksiyon kullanıcı bir hücrenizi seçtiği zaman(üstüne tıkladığı zaman) çalışır.
        // indexPath üzerine tıklanlan hücrenin konum bilgisi.
        
        // indexPath'in row property'sini kullanarak üzerine tıklanan emoji nesnesine ulaşılanbilir.
        let emojiIndex = emojis[indexPath.row]
        //
        performSegue(withIdentifier: "toEditEmoji", sender: nil)
        
        print("Seçtiniz : \(emojiIndex.symbol)")
        
        
    }
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        // soureceIndexPath: Sırası değiştirilmek istenen hücrenin konumu.
        // destinationIndexPath: Gidilmesi istenilen konum. (Parmak erkan kaldırılınca)
        
        // ÇOK ÖNEMLİ: "emojis" array'in tableView hücre sırası için her zaman aynı kalmasi gerekir.
        // Bu senkronu sağlayabilmek için hareket ettirilen objenin array'de de konumu değiştirilir.
        
        // Adım 1: Hareket ettirilen Emoji nesnesine ulaşmak ve array'den silmek.
        let moveEmoji = emojis.remove(at: sourceIndexPath.row)
        
        // Adim 2: silenen elemanı, array'de yeni konumuna(gidilecek konuma) yerleştirmek.
        emojis.insert(moveEmoji, at: destinationIndexPath.row)
        
        // Adim 3: TableView'ın yeniden çizilmesini sağlamak
        // Böylece TableView güncelenen array sırası ile tüm elemanlarını tekrardan çizecek.
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        // Bu fonksiyon, TableView editing modundayken her hücrenin
        // hangi tür editingStyle'a sahip olacağını belirtir.
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // indexPath editing aksiyonun gerçekleştiği hücrenin konumu.
        // editingStyle: Gerçekleşen aksiyon. (.delete veya .insert)
        if editingStyle == .delete {
            // Adim1 : "emojis" array'inde indexPath.row'da bulunan objeyi sil.
            emojis.remove(at: indexPath.row)
            
            //Adim:2 TableView'a hücrenin silinmesi gerektiği bilgisi verilir.
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    // MARK: - Actions

    @IBAction func editButtonTapped(_ button: UIBarButtonItem) {
        
        let tableViewEdittingMode = tableView.isEditing
        
        // TableView'ın editing moda girmesini ve çıkmasını sağlar
        // ! Boolean değernin tersini alır.
        tableView.setEditing(!tableViewEdittingMode, animated: true)
    }
    
    @IBAction func unwindFromNewEmoji(_ segue: UIStoryboardSegue) {
        // Bu fonksiyon, newEmojiViewController tarafından çalıştırılacak.
        
        // NewEmojiViewontroller tarafından tetiklenen segue'nin save olduğunda test eder.
        guard segue.identifier == "sageUnwing",
              let sourceViewController = segue.source as? NewEmojiTableViewController,
              let newEmoji = sourceViewController.emoji else { return }
        
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            
            emojis[selectedIndexPath.row] = newEmoji
            
            tableView.reloadRows(at: [selectedIndexPath], with: .none)
        }else {
            // Adim 1 : Yeni bir hücre için IndexPath oluştur.
            // 15 erişip daha sonrasına ekleme yapıyoruz bu sıra değiştiğinde genelde sorunla karşılaşıyoruz.
            let newIndexPath = IndexPath(row: emojis.count, section: 0)
            
            // Adım 2 : Yeni Emoji objesini "Emojis" array'ine ekle.
            emojis.append(newEmoji)
            
            // Adim 3 : Oluşturulan IndexPath ile tableview'a yeni hücre eklenir.
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
    

}
