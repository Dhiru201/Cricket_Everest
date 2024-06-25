//
//  CricketCommentaryGenerator.swift
//  Cricket_Everest
//
//  Created by Dharmendra Verma on 11/06/24.
//

import Foundation

protocol CommentaryGenerator {
    func generate(bowl: Bowl, shot: Shot) -> String
   // func generateCommentary(bowl: String, shot: String, timing: String, outcome: String) -> String
}

class CricketCommentaryGenerator: CommentaryGenerator {
    private let predictor: OutcomePredictor

    init(predictor: OutcomePredictor) {
        self.predictor = predictor
    }

    func generate(bowl: Bowl, shot: Shot) -> String {
        let outcome = predictor.predict(bowl, shot)
        return "\(bowl.name) \(shot.name) \(shot.timing) - \(outcome.commentary) - \(outcome.shotOutcome)"
    }
}
