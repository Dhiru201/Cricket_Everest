//
//  SuperOverTests.swift
//  Cricket_EverestTests
//
//  Created by Dhirendra Verma on 11/06/24.
//

import XCTest
@testable import Cricket_Everest


// Mock classes for OutcomePredictor and CommentaryGenerator
class MockOutcomePredictor: OutcomePredictor {
    var mockOutcomes: [Outcome] = []
    func predict(_ bowl: Bowl, _ shot: Shot) -> Outcome {
        return mockOutcomes.removeFirst()
    }
}

class MockCommentaryGenerator: CommentaryGenerator {
    var mockGenerateClosure: ((Bowl, Shot) -> String)?

    func generate(bowl: Bowl, shot: Shot) -> String {
        return mockGenerateClosure!(bowl, shot)
    }
}


final class SuperOverTests: XCTestCase {
    var predictor: OutcomePredictor!
    var generator: CommentaryGenerator!
    var simulator: CricketSuperOverSimulator!
    
    override func setUp() {
        super.setUp()
        predictor = MockOutcomePredictor()
        generator = MockCommentaryGenerator()
        simulator = CricketSuperOverSimulator(predictor: predictor, generator: generator)
    }


    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testSimulateSuperOverWithWin() {
            // Mock the predictor outcomes
            (predictor as! MockOutcomePredictor).mockOutcomes = [
                Outcome(shotOutcome: .sixRun, commentary: .itsAHugeHit),
                Outcome(shotOutcome: .sixRun, commentary: .itsAMassiveSix),
                Outcome(shotOutcome: .sixRun, commentary: .perfectShot),
                Outcome(shotOutcome: .threeRun, commentary: .excellentRunning),
                Outcome(shotOutcome: .oneRun, commentary: .excellentRunning),
                Outcome(shotOutcome: .zeroRun, commentary: .missTheBall)
            ]

            // Mock the generator commentary
            (generator as! MockCommentaryGenerator).mockGenerateClosure = { bowl, shot in
                let outcome = (self.predictor as! MockOutcomePredictor).predict(bowl, shot)
                return "\(bowl.name) \(shot.name) \(shot.timing) - \(outcome.commentary) - \(outcome.shotOutcome)"
            }

            simulator.simulateSuperOver()
        }

        func testSimulateSuperOverWithLoss() {
            // Mock the predictor outcomes
            (predictor as! MockOutcomePredictor).mockOutcomes = [
                Outcome(shotOutcome: .oneRun, commentary: .excellentRunning),
                Outcome(shotOutcome: .zeroRun, commentary: .missTheBall),
                Outcome(shotOutcome: .oneWicket, commentary: .itsAWicket),
                Outcome(shotOutcome: .sixRun, commentary: .itsAHugeHit),
                Outcome(shotOutcome: .fourRun, commentary: .niceShot),
                Outcome(shotOutcome: .oneWicket, commentary: .itsAWicket)
            ]

            // Mock the generator commentary
            (generator as! MockCommentaryGenerator).mockGenerateClosure = { bowl, shot in
                let outcome = (self.predictor as! MockOutcomePredictor).predict(bowl, shot)
                return "\(bowl.name) \(shot.name) \(shot.timing) - \(outcome.commentary) - \(outcome.shotOutcome)"
            }

            simulator.simulateSuperOver()
        }

}
