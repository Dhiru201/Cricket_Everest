//
//  OutcomePredictorTests.swift
//  Cricket_EverestTests
//
//  Created by Dhirendra Verma on 11/06/24.
//

import XCTest
@testable import Cricket_Everest

final class OutcomePredictorTests: XCTestCase {
    let predictor = CricketOutcomePredictor()
    
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

    func testPredictPerfectPullOnBouncer() {
        let bowl = Bowl(name: .bouncer)
        let shot = Shot(name: .pull, timing: .perfect)
        let expectedOutcome = Outcome(shotOutcome: .sixRun, commentary: .itsAHugeHit)
        XCTAssertEqual(expectedOutcome, predictor.predict(bowl, shot))
    }

    func testPredictGoodPullOnBouncer() {
        let bowl = Bowl(name: .bouncer)
        let shot = Shot(name: .pull, timing: .good)
        let expectedOutcome = Outcome(shotOutcome: .fourRun, commentary: .excellentEffortOnTheBoundary)
        XCTAssertEqual(expectedOutcome, predictor.predict(bowl, shot))
    }

    func testPredictEarlyPullOnBouncer() {
        let bowl = Bowl(name: .bouncer)
        let shot = Shot(name: .pull, timing: .early)
        let expectedOutcome = Outcome(shotOutcome: .oneRun, commentary: .goodEffort)
        XCTAssertEqual(expectedOutcome, predictor.predict(bowl, shot))
    }

    func testPredictLatePullOnBouncer() {
        let bowl = Bowl(name: .bouncer)
        let shot = Shot(name: .pull, timing: .late)
        let expectedOutcome = Outcome(shotOutcome: .zeroRun, commentary: .edgedAndTaken)
        XCTAssertEqual(expectedOutcome, predictor.predict(bowl, shot))
    }

    func testPredictEmptyCombination() {
        let bowl = Bowl(name: .none)
        let shot = Shot(name: .none, timing: .none)
        let expectedOutcome = Outcome(shotOutcome: .noResult, commentary: .noCommentary)
        XCTAssertEqual(expectedOutcome, predictor.predict(bowl, shot))
    }
    
}
