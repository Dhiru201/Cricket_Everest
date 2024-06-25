//
//  Bowl.swift
//  Cricket_Everest
//
//  Created by Dhirendra Verma on 11/06/24.
//

import Foundation

enum BowlType: String {
    case bouncer = "Bouncer"
    case outswinger = "Outswinger"
    case yorker = "Yorker"
    case offBreak = "Off Break"
    case inswinger = "Inswinger"
    case legCutter = "Leg Cutter"
    case slower = "Slower Ball"
    case pace = "Pace"
    case offCutter = "Off Cutter"
    case doosra = "Doosra"
    case none = ""
}

struct Bowl {
    let name: BowlType
}
