//
//  ViewController.swift
//  Landmark Book
//
//  Created by Hakan Sezer on 14.09.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var landmarkNames = [String]()
    var landMarkImages = [UIImage]()
    
    var chosenLandmarkName = ""
    var chosenLandmarkImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        landmarkNames.append("colosseum")
        landmarkNames.append("greatwall")
        landmarkNames.append("kremlin")
        
        
        landMarkImages.append(UIImage(named: "colosseum")!)
        landMarkImages.append(UIImage(named: "greatwall")!)
        landMarkImages.append(UIImage(named: "kremlin")!)
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToSecond" {
            let destinationVC = segue.destination as! SecondViewController
            destinationVC.selectedLandName = chosenLandmarkName
            destinationVC.selectedLandmarkImage = chosenLandmarkImage
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = landmarkNames[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenLandmarkName = landmarkNames[indexPath.row]
        chosenLandmarkImage = landMarkImages[indexPath.row]
        performSegue(withIdentifier: "goToSecond", sender: nil)
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

        if editingStyle == .delete {
            self.landmarkNames.remove(at: indexPath.row)
            self.landMarkImages.remove(at: indexPath.row)
            // verilerin değiştiği için bu kullanıyoruz.
            tableView.deleteRows(at: [indexPath], with: .automatic)
        
        }
    }
    
    
}

