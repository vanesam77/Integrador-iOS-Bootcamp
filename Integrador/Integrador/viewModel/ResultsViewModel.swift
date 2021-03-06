//
//  ResultsViewModel.swift
//  Integrador
//
//  Created by Pablo Quagliata on 21/9/21.
//

import Foundation

class ResultsViewModel {
    let type: Screen
    let activity: String?
    let participant: Int?
    let priceRange: (Double, Double)?
    var suggestion: Suggestion? = nil
    
    init(type: Screen, activity: String?, participant: Int?, priceRange: (Double, Double)?) {
        self.type = type
        self.activity = activity
        self.participant = participant
        self.priceRange = priceRange
    }
    
    func getRandomSuggestion(completion: @escaping (() -> Void)) {
        if let participant = participant,
           let priceRange = priceRange {
            SuggestionService().getSuggestionRandomForRange(participants: participant, minprice: priceRange.0, maxprice: priceRange.1) { suggestion in
                self.suggestion = suggestion
                completion()
            }
        }
    }
    
    func getSuggestion(completion: @escaping () -> Void) {
        if let activity = self.activity,
           let participant = self.participant {
            SuggestionService().getSuggestionForParticipantsAndType(for: activity, participants: participant) { suggestion in
                self.suggestion = suggestion
                completion()
            }
        }
    }
    
    func getSuggestionForParticipants(completion: @escaping () -> Void) {
        if let participant = participant {
            SuggestionService().getSuggestionRandomForParticipants(participant) { suggestion in
                self.suggestion = suggestion
                completion()
            }
        }
    }
    
    func getSuggestionForPriceRange(completion: @escaping () -> Void) {
        if let activity = activity,
           let participant = participant,
           let priceRange = priceRange {
            SuggestionService().getSuggestionForRange(for: activity, participants: participant, minprice: priceRange.0, maxprice: priceRange.1) { suggestion in
                self.suggestion = suggestion
                completion()
            }
        }
    }
}
