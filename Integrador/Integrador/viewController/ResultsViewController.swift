//
//  RandomViewController.swift
//  Integrador
//
//  Created by Vanesa Raquel Mizrahi on 18/09/2021.
//

import UIKit

enum Screen {
    case random
    case suggestion
}

class ResultsViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var activityLabel: UILabel!
    @IBOutlet weak var participantsLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var tryAnotherButton: UIButton! {
        didSet {
            tryAnotherButton.layer.cornerRadius = tryAnotherButton.bounds.height/10
        }
    }
    @IBOutlet weak var typeImageView: UIImageView!
    
    // MARK: Properties
    let viewModel: ResultsViewModel
    
    init(viewModel: ResultsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.backgroundColor = UIColor(named: "boredMediumColor")
        navigationController?.navigationBar.tintColor = UIColor(named: "boredAccentColor")
        navigationController?.tabBarItem.title = title
        navigationController!.navigationBar.prefersLargeTitles = true
        
        switch viewModel.type {
        case .suggestion:
            typeLabel.isHidden = true
            typeImageView.isHidden = true
            
            viewModel.getSuggestionForPriceRange() {
                guard let suggestion = self.viewModel.suggestion else { return }
                self.activityLabel.text = suggestion.activity
                self.participantsLabel.text = "\(suggestion.participants)"
                self.priceLabel.text = self.getPriceRange(for: suggestion.price)
            }
            
        default:
            typeLabel.isHidden = false
            typeImageView.isHidden = false
            
            if let participant = viewModel.participant {
                viewModel.getRandomSuggestion {
                    guard let suggestion = self.viewModel.suggestion else { return }
                    self.activityLabel.text = suggestion.activity
                    self.participantsLabel.text = "\(participant)"
                    self.priceLabel.text = self.getPriceRange(for: suggestion.price)
                    self.typeLabel.text = suggestion.type.capitalized
                }
            } else {
                viewModel.getRandomSuggestion {
                    guard let suggestion = self.viewModel.suggestion else { return }
                    self.activityLabel.text = suggestion.activity
                    self.participantsLabel.text = "\(suggestion.participants)"
                    self.priceLabel.text = self.getPriceRange(for: suggestion.price)
                    self.typeLabel.text = suggestion.type.capitalized
                }
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
        default: break
        }
        
        return priceRange
    }
    
    @IBAction func tryAnotherButtonTaped(_ sender: Any) {
        
        switch viewModel.type {
        case .suggestion:
            
            viewModel.getSuggestionForPriceRange {
                guard let suggestion = self.viewModel.suggestion else { return }
                self.activityLabel.text = suggestion.activity
                self.participantsLabel.text = "\(suggestion.participants)"
                self.priceLabel.text = self.getPriceRange(for: suggestion.price)
            }

        default:
            viewModel.getRandomSuggestion {
                guard let suggestion = self.viewModel.suggestion else { return }
                self.activityLabel.text = suggestion.activity
                self.participantsLabel.text = "\(suggestion.participants)"
                self.priceLabel.text = self.getPriceRange(for: suggestion.price)
                self.typeLabel.text = suggestion.type.capitalized
            }
        }
    }
}
