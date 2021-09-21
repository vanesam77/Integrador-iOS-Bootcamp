//
//  SuggestionViewController.swift
//  Integrador
//
//  Created by Vanesa Raquel Mizrahi on 18/09/2021.
//

import UIKit

class SuggestionViewController: UIViewController {
    
    @IBOutlet weak var activityLabel: UILabel!
    @IBOutlet weak var participantsLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var tryAnotherButton: UIButton!
    
    var theActivity: String? = nil
    var theParticipant: Int?
    
    func didUpdateParticipants(participant: Int) {
        self.theParticipant = participant
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.backgroundColor = UIColor(named: "boredMediumColor")
        navigationController?.navigationBar.tintColor = UIColor(named: "boredAccentColor")
        tryAnotherButton.layer.cornerRadius = tryAnotherButton.bounds.height/8
        
        if let activity = theActivity {
            SuggestionService().getSuggestion(for: activity) { suggestion in
                let suggestion = suggestion
                self.activityLabel.text = suggestion.activity
                self.participantsLabel.text = "\(suggestion.participants)"
                self.priceLabel.text = self.getPriceRange(for: suggestion.price)
            }
        }
    }

    @IBAction func tryAnotherButtonTaped(_ sender: Any) {
        if let activity = theActivity {
            SuggestionService().getSuggestion(for: activity) { [self] suggestion in
                let suggestion = suggestion
                self.activityLabel.text = suggestion.activity
                self.participantsLabel.text = "\(suggestion.participants)"
                self.priceLabel.text = self.getPriceRange(for: suggestion.price)
            }
        }
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
    


}
