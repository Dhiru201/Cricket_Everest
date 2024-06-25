//
//  CommentaryTests.swift
//  Cricket_EverestTests
//
//  Created by Dhirendra Verma on 11/06/24.
//

import XCTest
@testable import Cricket_Everest

final class CommentaryTests: XCTestCase {
    let predictor = CricketOutcomePredictor()
    lazy var generator = CricketCommentaryGenerator(predictor: predictor)

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
    
    func testGenerateCommentaryForPerfectPullOnBouncer() {
        let bowl = Bowl(name: .bouncer)
        let shot = Shot(name: .pull, timing: .perfect)
        let expectedCommentary = "Bouncer Pull Perfect - It’s a huge hit. - \(ShotOutcome.sixRun.rawValue)"
        XCTAssertEqual(expectedCommentary, generator.generate(bowl: bowl, shot: shot))
    }

    func testGenerateCommentaryForUnknownCombination() {
        let bowl = Bowl(name: .none)
        let shot = Shot(name: .none, timing: .none)
        let expectedCommentary = "   - No Commentary available. - No result"
        XCTAssertEqual(expectedCommentary, generator.generate(bowl: bowl, shot: shot))
    }

}
