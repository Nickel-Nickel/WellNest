//
//  DailyMacro.swift
//  WellNest
//
//  Created by Reyssan Sambitan on 4/19/24.
//

import Foundation

struct DailyMacro: Identifiable {
    let id = UUID()
    let date: Date
    let carbs: Int
    let fats: Int
    let proteins: Int
}
