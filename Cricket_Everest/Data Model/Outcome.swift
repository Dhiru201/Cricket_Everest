//
//  Outcome.swift
//  Cricket_Everest
//
//  Created by Dhirendra Verma on 11/06/24.
//

import Foundation

enum ShotOutcome: String {
    case zeroRun = "0 runs"
    case oneRun = "1 run"
    case twoRun = "2 runs"
    case threeRun = "3 runs"
    case fourRun = "4 runs"
    case fiveRun = "5 runs"
    case sixRun = "6 runs"
    case oneWicket = "1 wicket"
    case noResult = "No result"
}

enum ShotCommentary: String {
    case itsAWicket = "It’s a wicket."
    case excellentLineAndLength = "Excellent line and length."
    case edgedAndTaken = "Edged and taken."
    case itsAHugeHit = "It’s a huge hit."
    case justOverTheFielder = "Just over the fielder."
    case excellentEffortOnTheBoundary = "Excellent effort on the boundary."
    case convertOnesIntoTwos = "Convert ones into twos."
    case thatsMassiveAndOutOfTheGround = "That’s massive and out of the ground."
    case goodEffort = "Good effort."
    case missTheBall = "Miss the ball"
    case missedItCompletely = "Missed it completely."
    case niceShot = "Nice shot."
    case perfectShot = "Perfect shot"
    case excellentRunning = "Excellent running between the wickets."
    case itsAMassiveSix = "Its A Massive Six!"
    case noCommentary = "No Commentary available."
}

struct Outcome: Equatable {
    let shotOutcome: ShotOutcome
    let commentary: ShotCommentary
    
    static func == (lhs: Outcome, rhs: Outcome) -> Bool {
           return lhs.shotOutcome == rhs.shotOutcome && lhs.commentary == rhs.commentary
       }
}
