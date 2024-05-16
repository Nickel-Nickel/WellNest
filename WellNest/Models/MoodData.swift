//
//  MoodData.swift
//  WellNest
//
//  Created by csuftitan on 5/15/24.
//

import Foundation

struct MoodData: Identifiable {
    var id = UUID()
    var mood: String
    var time: Date
    var date: Date
}
