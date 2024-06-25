//
//  MainViewController.swift
//  Cricket_Everest
//
//  Created by Dhirendra Verma on 11/06/24.
//

import UIKit

class MainViewController: UIViewController {
    var predictor: OutcomePredictor?
    var generator: CommentaryGenerator?
    var simulator: SuperOverSimulator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        predictor = CricketOutcomePredictor()
        guard let predictor else { return }
        generator = CricketCommentaryGenerator(predictor: predictor)
        guard let generator else { return }
        simulator = CricketSuperOverSimulator(predictor: predictor, generator: generator)
        simulator?.simulateSuperOver()
    }
}

