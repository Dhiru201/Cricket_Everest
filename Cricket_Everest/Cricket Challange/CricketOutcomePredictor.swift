//
//  CricketOutcomePredictor.swift
//  Cricket_Everest
//
//  Created by Dhirendra Verma on 11/06/24.
//

import Foundation

protocol OutcomePredictor {
    func predict(_ bowl: Bowl, _ shot: Shot) -> Outcome
}

class CricketOutcomePredictor: OutcomePredictor {
    private let outcomeMap: [BowlType: [ShotType: [ShotTiming: Outcome]]] = [
        BowlType.bouncer: [
            .pull: [
                .perfect: Outcome(shotOutcome: .sixRun, commentary: .itsAHugeHit),
                .late: Outcome(shotOutcome: .zeroRun, commentary: .edgedAndTaken),
                .good: Outcome(shotOutcome: .fourRun, commentary: .excellentEffortOnTheBoundary),
                .early: Outcome(shotOutcome: .oneRun, commentary: .goodEffort)
            ],
            .upperCut: [
                .perfect: Outcome(shotOutcome: .sixRun, commentary: .itsAMassiveSix),
                .late: Outcome(shotOutcome: .zeroRun, commentary: .itsAWicket),
                .good: Outcome(shotOutcome: .fourRun, commentary: .perfectShot),
                .early: Outcome(shotOutcome: .twoRun, commentary: .goodEffort)
            ]
        ],
        BowlType.outswinger: [
            .squareCut: [
                .good : Outcome(shotOutcome: .twoRun, commentary: .excellentRunning),
                .late : Outcome(shotOutcome: .zeroRun, commentary: .missTheBall),
                .perfect : Outcome(shotOutcome: .fourRun, commentary: .perfectShot),
                .early: Outcome(shotOutcome: .twoRun, commentary: .goodEffort)
            ]
        ],
        BowlType.yorker: [
            .straight: [
                .perfect: Outcome(shotOutcome: .fourRun, commentary: .perfectShot),
                .good: Outcome(shotOutcome: .oneRun, commentary: .excellentRunning),
                .early: Outcome(shotOutcome: .zeroRun, commentary: .missedItCompletely),
                .late: Outcome(shotOutcome: .zeroRun, commentary: .edgedAndTaken)
            ],
            .flick: [
                .perfect: Outcome(shotOutcome: .fourRun, commentary: .perfectShot),
                .good: Outcome(shotOutcome: .twoRun, commentary: .excellentRunning),
                .early: Outcome(shotOutcome: .zeroRun, commentary: .missTheBall),
                .late: Outcome(shotOutcome: .zeroRun, commentary: .edgedAndTaken)
            ]
        ],
        BowlType.offBreak: [
            .sweep: [
                .perfect: Outcome(shotOutcome: .sixRun, commentary: .itsAMassiveSix),
                .good: Outcome(shotOutcome: .twoRun, commentary: .convertOnesIntoTwos),
                .early: Outcome(shotOutcome: .oneRun, commentary: .excellentRunning),
                .late: Outcome(shotOutcome: .zeroRun, commentary: .missedItCompletely)
            ],
            .scoop: [
                .perfect: Outcome(shotOutcome: .fourRun, commentary: .perfectShot),
                .good: Outcome(shotOutcome: .twoRun, commentary: .convertOnesIntoTwos),
                .early: Outcome(shotOutcome: .oneRun, commentary: .excellentRunning),
                .late: Outcome(shotOutcome: .zeroRun, commentary: .missedItCompletely)
            ]
        ],
        BowlType.doosra: [
            .straight: [
                .perfect: Outcome(shotOutcome: .twoRun, commentary: .excellentRunning),
                .good: Outcome(shotOutcome: .oneRun, commentary: .justOverTheFielder),
                .early: Outcome(shotOutcome: .zeroRun, commentary: .itsAWicket),
                .late: Outcome(shotOutcome: .zeroRun, commentary: .itsAWicket)
            ]
        ],
        BowlType.slower: [
            .pull: [
                .perfect: Outcome(shotOutcome: .fourRun, commentary: .perfectShot),
                .good: Outcome(shotOutcome: .twoRun, commentary: .excellentRunning),
                .early: Outcome(shotOutcome: .zeroRun, commentary: .missedItCompletely),
                .late: Outcome(shotOutcome: .zeroRun, commentary: .missTheBall)
            ]
        ],
        BowlType.pace: [
            .straight: [
                .perfect: Outcome(shotOutcome: .fourRun, commentary: .perfectShot),
                .good: Outcome(shotOutcome: .twoRun, commentary: .excellentRunning),
                .early: Outcome(shotOutcome: .zeroRun, commentary: .missedItCompletely),
                .late: Outcome(shotOutcome: .zeroRun, commentary: .missTheBall)
            ]
        ]
    ]

    func predict(_ bowl: Bowl, _ shot: Shot) -> Outcome {
        return outcomeMap[bowl.name]?[shot.name]?[shot.timing] ?? Outcome(shotOutcome: .noResult, commentary: .noCommentary)
    }
}
