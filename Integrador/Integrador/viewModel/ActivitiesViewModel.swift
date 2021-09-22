//
//  ActivitiesViewModel.swift
//  Integrador
//
//  Created by Pablo Quagliata on 21/9/21.
//

import Foundation

class ActivitiesViewModel {
    let activities: [String] = ["education", "recreational", "social", "diy", "charity", "cooking", "relaxation", "music", "busywork"]
    var participant: Int?
    var priceRange: (Double, Double)?
    
    init(participant: Int?, priceRange: (Double, Double)?) {
        self.participant = participant
        self.priceRange = priceRange
    }
}
