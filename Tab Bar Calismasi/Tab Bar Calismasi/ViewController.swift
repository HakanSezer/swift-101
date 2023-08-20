//
//  ViewController.swift
//  Tab Bar Calismasi
//
//  Created by Hakan Sezer on 20.08.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var profilSayas = 0
    var isSayac = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    @IBAction func profilArttır(_ sender: Any) {
        
        if let tabItem = tabBarController?.tabBar.items {
            
            // Bunla hangi tab'a erişeceğimizi belirlemiş oluyoruz.
            let profileTabBarItem = tabItem[0]
            
            profilSayas = profilSayas + 1
            
            
            profileTabBarItem.badgeColor = .purple
            profileTabBarItem.badgeValue = String(profilSayas)
        }
        
        
        // MARK: BENİM YAZMIŞ OLDUĞUM KOD.
        /*
        if let tabItem = tabBarController?.tabBar.items {
            
            // Bunla hangi tab'a erişeceğimizi belirlemiş oluyoruz.
            let profileTabBarItem = tabItem[0]
            
            profileTabBarItem.badgeColor = .purple
            
            
            for _ in String(profilSayas) {
                print("Selam")
                profilSayas += 1
                profileTabBarItem.badgeValue = String(profilSayas)
        }
         */
    }
    
    @IBAction func isArttır(_ sender: Any) {
        
        if let tabItem = tabBarController?.tabBar.items {
            
            // Bunla hangi tab'a erişeceğimizi belirlemiş oluyoruz.
            let profileTabBarItem = tabItem[0]
            
            isSayac = isSayac + 1
            
            
            profileTabBarItem.badgeColor = .purple
            profileTabBarItem.badgeValue = String(isSayac)
        }
        
        
        
        
        //MARK: Benim Yazdığım Kod.
        /*
        if let tabItem = tabBarController?.tabBar.items {
            
            // Bunla hangi tab'a erişeceğimizi belirlemiş oluyoruz.
            let isTabBarItem = tabItem[1]
            
            isTabBarItem.badgeColor = .purple
            
            
            for _ in String(isSayac) {
                print("Selam")
                isSayac += 1
                isTabBarItem.badgeValue = String(isSayac)
            }
            
        }
         */
    }
    
}

