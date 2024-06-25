//
//  Commentary.swift
//  Cricket_Everest
//
//  Created by Dhirendra Verma on 11/06/24.
//

import Foundation

protocol CommentaryGenerator {
    func generate(bowl: Bowl, shot: Shot) -> String
}

class CricketCommentaryGenerator: CommentaryGenerator {
    private let predictor: OutcomePredictor

    init(predictor: OutcomePredictor) {
        self.predictor = predictor
    }

    func generate(bowl: Bowl, shot: Shot) -> String {
        let outcome = predictor.predict(bowl, shot)
        return "\(bowl.name.rawValue) \(shot.name.rawValue) \(shot.timing.rawValue) - \(outcome.commentary.rawValue) - \(outcome.shotOutcome.rawValue)"
    }
}
