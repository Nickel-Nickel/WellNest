//
//  ResponseModels.swift
//  WellNest
//
//  Created by Reyssan Sambitan on 4/19/24.
//

import Foundation

struct GPTResponse: Decodable {
    let choices: [GPTCompletion]
}

struct GPTCompletion: Decodable {
    let message: GPTResponseMessage
}

struct GPTResponseMessage: Decodable {
    let functionCall: GPTFunctionCall?
    
    enum CodingKeys: String, CodingKey {
        case functionCall = "function_call"
    }
}

struct GPTFunctionCall: Decodable {
    let name: String
    let arguments: String
}

struct MacroResult: Decodable {
    var food: String
    var fats: Int
    var proteins: Int
    var carbs: Int
}
