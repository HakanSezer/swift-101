//
//  ViewController.swift
//  TabBarController Ozellestirme
//
//  Created by Hakan Sezer on 20.08.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // tabBarController -> Önüne koyduğumuz ilk genel TabBar
        // tabBar -> Tab barın altında bulunan bölüm
        // items -> Alt kısımdaki bulunan iconlar
        if let tabItems = tabBarController?.tabBar.items {
            // hangi tab'ı seçtiğimizi belirliyoruz.
            let item = tabItems[0]
            // Burada tabItem's üstüne bildirim gibi sayı yazdırıyoruz.
            item.badgeValue = "2"
        }
        // Bu appearance ile değişimi sağlamak için kullanılır.
        //Çalışmaları bir çok ekranda aynı şeyi vermesi gerekiyor Bunu da "APPEARANCE" dediğimiz sistem gelmiştir.
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = .systemIndigo
        
        renkDegistir(itemAppearance: appearance.compactInlineLayoutAppearance)
        renkDegistir(itemAppearance: appearance.inlineLayoutAppearance)
        renkDegistir(itemAppearance: appearance.stackedLayoutAppearance)
        
        
        tabBarController?.tabBar.standardAppearance = appearance
        tabBarController?.tabBar.scrollEdgeAppearance = appearance
    }
    
    
    func renkDegistir(itemAppearance: UITabBarItemAppearance) {
        // Seçili Durum
        itemAppearance.selected.iconColor = .systemOrange
        itemAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.systemOrange]
        itemAppearance.selected.badgeBackgroundColor = .systemGreen
        
        
        
        // Seçili Olmayan durum
        itemAppearance.normal.iconColor = .white
        itemAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.white]
        itemAppearance.normal.badgeBackgroundColor = .systemGray
    }


}

