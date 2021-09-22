//
//  ResultsViewModel.swift
//  Integrador
//
//  Created by Pablo Quagliata on 21/9/21.
//

import Foundation

class ResultsViewModel {
    let type: Screen
    var activity: String?
    let participant: Int?
    var suggestion: Suggestion? = nil
    
    init(type: Screen, activity: String?, participant: Int?) {
        self.type = type
        self.activity = activity
        self.participant = participant
    }
    
    func getRandomSuggestion(completion: @escaping (() -> Void)) {
        SuggestionService().getSuggestionRandom { suggestion in
            self.suggestion = suggestion
            completion()
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
}
