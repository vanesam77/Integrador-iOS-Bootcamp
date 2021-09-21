//
//  RandomViewController.swift
//  Integrador
//
//  Created by Vanesa Raquel Mizrahi on 18/09/2021.
//

import UIKit

class RandomViewController: UIViewController {

    @IBOutlet weak var activityLabel: UILabel!
    @IBOutlet weak var participantsLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var tryAnotherButton: UIButton!
    
    var theParticipant: Int?
    
    func didUpdateParticipants(participant: Int) -> Int {
        self.theParticipant = participant
        return self.theParticipant!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.backgroundColor = UIColor(named: "boredMediumColor")
        navigationController?.navigationBar.tintColor = UIColor(named: "boredAccentColor")
        
        tryAnotherButton.layer.cornerRadius = tryAnotherButton.bounds.height/8
        SuggestionService().getSuggestionRandom {suggestion in
            let suggestion = suggestion
            self.activityLabel.text = suggestion.activity
            self.participantsLabel.text = "\(suggestion.participants)"
            self.priceLabel.text = self.getPriceRange(for: suggestion.price)
            self.typeLabel.text = suggestion.type
        }
        
        
//        if let participant = self.theParticipant {
//            SuggestionService().getSuggestionRandomForParticipants(participant) { suggestion in
//                let suggestion = suggestion
//                self.activityLabel.text = suggestion.activity
//                self.participantsLabel.text = "\(participant)"
//                self.priceLabel.text = self.getPriceRange(for: suggestion.price)
//                self.typeLabel.text = suggestion.type
//            }
//        }
    }

    
    private func getPriceRange(for price: Double) -> String {
        var priceRange: String = ""
        switch price {
        case 0.0: priceRange = "Free"
        case 0.01...0.3: priceRange = "Low"
        case 0.31..<0.6: priceRange = "Medium"
        case 0.6...1: priceRange = "High"
        default: print("")
        }
        return priceRange
    }

    @IBAction func tryAnotherButtonTaped(_ sender: Any) {
        SuggestionService().getSuggestionRandom {suggestion in
            let suggestion = suggestion
            self.activityLabel.text = suggestion.activity
            self.participantsLabel.text = "\(suggestion.participants)"
            self.priceLabel.text = self.getPriceRange(for: suggestion.price)
            self.typeLabel.text = suggestion.type.capitalized
        }
    }
}
