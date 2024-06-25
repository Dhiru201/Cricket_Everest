//
//  Shot.swift
//  Cricket_Everest
//
//  Created by Dhirendra Verma on 11/06/24.
//

import Foundation

enum ShotType: String {
    case straight = "Straight"
    case flick = "Flick"
    case legLance = "LegLance"
    case longOn = "Long On"
    case squareCut = "SquareCut"
    case sweep = "Sweep"
    case coverDrive = "CoverDrive"
    case pull = "Pull"
    case scoop = "Scoop"
    case upperCut = "UpperCut"
    case none = ""
}

enum ShotTiming: String {
    case early = "Early"
    case good = "Good"
    case perfect = "Perfect"
    case late = "Late"
    case none = ""
}

struct Shot {
    let name: ShotType
    let timing: ShotTiming
}
