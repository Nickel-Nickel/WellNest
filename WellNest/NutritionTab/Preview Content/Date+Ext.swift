//
//  Date+Ext.swift
//  WellNest
//
//  Created by Reyssan Sambitan on 4/19/24.
//

import Foundation

extension Date {
    var monthAndDay: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM \nd"
        return formatter.string(from: self)
    }
    
    var year: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY"
        return formatter.string(from: self)
    }
}
