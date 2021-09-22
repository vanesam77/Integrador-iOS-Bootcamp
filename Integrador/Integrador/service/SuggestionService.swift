//
//  SuggestionService.swift
//  Integrador
//
//  Created by Vanesa Raquel Mizrahi on 18/09/2021.
//

import Foundation
import Alamofire

class SuggestionService {
    let apiClient = AlamofireAPIClient()

    func getSuggestion(for activityType: String, completion: @escaping ((Suggestion)->Void)) {
        let suggestionURL = "http://www.boredapi.com/api/activity?type=\(activityType)"
        apiClient.get(url: suggestionURL) { response in
            switch response {
            case .success(let data):
                do {
                    if let data = data {
                        let suggestion = try
                            JSONDecoder().decode(Suggestion.self, from: data)
                        completion(suggestion)
                    }
                } catch {
                    completion(Suggestion(activity: "", type: "", participants: 0, price: 0.0))
                }
            case .failure(_):
                completion(Suggestion(activity: "", type: "", participants: 0, price: 0.0))
            }
        }
    }
    
    func getSuggestionForParticipantsAndType(for activityType: String, participants: Int, completion: @escaping ((Suggestion)->Void)) {
        let suggestionURL = "https://www.boredapi.com/api/activity?type=\(activityType)&participants=\(participants)"
        apiClient.get(url: suggestionURL) { response in
            switch response {
            case .success(let data):
                do {
                    if let data = data {
                        let suggestion = try
                            JSONDecoder().decode(Suggestion.self, from: data)
                        completion(suggestion)
                    }
                } catch {
                    completion(Suggestion(activity: "", type: "", participants: 0, price: 0.0))
                }
            case .failure(_):
                completion(Suggestion(activity: "", type: "", participants: 0, price: 0.0))
            }
        }
    }
    
    func getSuggestionForRange(for activityType: String, participants: Int, minprice: Double, maxprice: Double, completion: @escaping ((Suggestion)->Void)) {
        let suggestionURL = "https://www.boredapi.com/api/activity?type=\(activityType)&participants=\(participants)&minprice=\(minprice)&maxprice=\(maxprice)"
        apiClient.get(url: suggestionURL) { response in
            switch response {
            case .success(let data):
                do {
                    if let data = data {
                        let suggestion = try
                            JSONDecoder().decode(Suggestion.self, from: data)
                        completion(suggestion)
                    }
                } catch {
                    completion(Suggestion(activity: "", type: "", participants: 0, price: 0.0))
                }
            case .failure(_):
                completion(Suggestion(activity: "", type: "", participants: 0, price: 0.0))
            }
        }
    }
    
    func getSuggestionRandom(completion: @escaping ((Suggestion)->Void)) {
        let suggestionURL = "http://www.boredapi.com/api/activity/"
        apiClient.get(url: suggestionURL) { response in
            switch response {
            case .success(let data):
                do {
                    if let data = data {
                        let suggestion = try
                            JSONDecoder().decode(Suggestion.self, from: data)
                        completion(suggestion)
                    }
                } catch {
                    completion(Suggestion(activity: "", type: "", participants: 0, price: 0.0))
                }
            case .failure(_):
                completion(Suggestion(activity: "", type: "", participants: 0, price: 0.0))
            }
        }
    }
    
    func getSuggestionRandomForParticipants(_ participants: Int,completion: @escaping ((Suggestion)->Void)) {
        let suggestionURL = "http://www.boredapi.com/api/activity?participants=\(participants)"
        apiClient.get(url: suggestionURL) { response in
            switch response {
            case .success(let data):
                do {
                    if let data = data {
                        let suggestion = try
                            JSONDecoder().decode(Suggestion.self, from: data)
                        completion(suggestion)
                    }
                } catch {
                    completion(Suggestion(activity: "", type: "", participants: participants, price: 0.0))
                }
            case .failure(_):
                completion(Suggestion(activity: "", type: "", participants: participants, price: 0.0))
            }
        }
    }
    
    func getSuggestionRandomForRange(for activityType: String, participants: Int, minprice: Double, maxprice: Double, completion: @escaping ((Suggestion)->Void)) {
        let suggestionURL = "https://www.boredapi.com/api/activity?&participants=\(participants)&minprice=\(minprice)&maxprice=\(maxprice)"
        apiClient.get(url: suggestionURL) { response in
            switch response {
            case .success(let data):
                do {
                    if let data = data {
                        let suggestion = try
                            JSONDecoder().decode(Suggestion.self, from: data)
                        completion(suggestion)
                    }
                } catch {
                    completion(Suggestion(activity: "", type: "", participants: 0, price: 0.0))
                }
            case .failure(_):
                completion(Suggestion(activity: "", type: "", participants: 0, price: 0.0))
            }
        }
    }
    
}




