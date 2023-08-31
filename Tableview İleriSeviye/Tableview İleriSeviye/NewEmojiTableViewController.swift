//
//  NewEmojiTableViewController.swift
//  Tableview İleriSeviye
//
//  Created by Hakan Sezer on 31.08.2023.
//

import UIKit

class NewEmojiTableViewController: UITableViewController {
    
    // MARK: - UI Elements
    
    @IBOutlet weak var usageTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var symbolTextField: UITextField!
    
    var emoji: Emoji?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let emoji = emoji {
            symbolTextField.text = emoji.symbol
            descriptionTextField.text = emoji.description
            nameTextField.text = emoji.name
            usageTextField.text = emoji.usage
        }
    }
    
    // MARK: - Function
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Yanlızca saveUnwind ise çalışmaya devam etmeli.
        
        guard segue.identifier == "saveUnwing" else { return }
        // Kulalnını girdiği bilgilere erişilir.
        let symbol =  symbolTextField.text!
        let name = nameTextField.text!
        let description = descriptionTextField.text!
        let usage = usageTextField.text!
        // Girilen bilgiler kullanılarak bir emoji nesnesi oluşturulur
        // ve emoji property'sine atanır.
        emoji = Emoji(symbol: symbol, name: name, description: description, usage: usage)
    }
}
