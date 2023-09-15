//
//  SimpsonClass.swift
//  SimpsonBook
//
//  Created by Hakan Sezer on 15.09.2023.
//

import Foundation
import UIKit

enum SimpsonJobs {
    case Enginerr
    case CoffeeMaker
    case pilot
}

class SimpsonClass {
    var nameSimpson: String
    var ageSimpson: Int
    var jobsSimpson: SimpsonJobs
    var imageSimpson: UIImage
    
    
    init(nameSimpson: String, ageSimpson: Int, jobsSimpson: SimpsonJobs, imageSimpson: UIImage) {
        self.nameSimpson = nameSimpson
        self.ageSimpson = ageSimpson
        self.jobsSimpson = jobsSimpson
        self.imageSimpson = imageSimpson
    }
}

