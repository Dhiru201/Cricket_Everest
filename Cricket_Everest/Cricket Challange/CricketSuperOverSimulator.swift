//
//  SuperOver.swift
//  Cricket_Everest
//
//  Created by Dhirendra Verma on 11/06/24.
//

import Foundation


protocol SuperOverSimulator {
    func simulateSuperOver()
}

class CricketSuperOverSimulator: SuperOverSimulator {
    private let predictor: OutcomePredictor
    private let generator: CommentaryGenerator

    init(predictor: OutcomePredictor, generator: CommentaryGenerator) {
        self.predictor = predictor
        self.generator = generator
    }

    func simulateSuperOver() {
        let bowls = [
            Bowl(name: .bouncer),
            Bowl(name: .bouncer),
            Bowl(name: .outswinger),
            Bowl(name: .yorker),
            Bowl(name: .offBreak),
            Bowl(name: .doosra)
        ]
        let shots = [
            Shot(name: .pull, timing: .perfect),
            Shot(name: .upperCut, timing: .early),
            Shot(name: .squareCut, timing: .good),
            Shot(name: .straight, timing: .late),
            Shot(name: .sweep, timing: .late),
            Shot(name: .straight, timing: .early)
        ]

        var totalRuns = 0
        var wickets = 0
        let target = 21

        for (index, (bowl, shot)) in zip(bowls, shots).enumerated() {
            if wickets == 2 || totalRuns >= target { break }

            let outcome = predictor.predict(bowl, shot)
            print("Ball \(index + 1): Sudhakar bowled \(bowl.name.rawValue) ball, Craig played \(shot.timing.rawValue) \(shot.name.rawValue). \(outcome.commentary.rawValue) - \(outcome.shotOutcome.rawValue)")

            switch outcome.shotOutcome {
            case .oneWicket:
                wickets += 1
            case .sixRun:
                totalRuns += 6
            case .fourRun:
                totalRuns += 4
            case .threeRun:
                totalRuns += 3
            case .twoRun:
                totalRuns += 2
            case .oneRun:
                totalRuns += 1
            case .zeroRun:
                totalRuns += 0
            default:
                break
            }
        }

        let result: String
        if totalRuns >= target {
            result = "AUSTRALIA won by \(2 - wickets) wicket(s)"
        } else {
            result = "AUSTRALIA lost by \(target - totalRuns) runs"
        }

        print("AUSTRALIA scored: \(totalRuns) runs")
        print(result)
    }
}
