//
//  RequestModels.swift
//  WellNest
//
//  Created by Reyssan Sambitan on 4/19/24.
//

import Foundation

struct GPTChatPayload: Encodable {
    let model: String
    let messages: [GPTMessage]
    let functions: [GPTFunction]
}

struct GPTMessage: Encodable {
    let role: String
    let content: String
}

struct GPTFunction: Encodable {
    let name: String
    let description: String
    let parameters: GPTFunctionParam
}

struct GPTFunctionParam: Encodable {
    let type: String
    let properties: [String: GPTFunctionProperty]
    let required: [String]?
}

struct GPTFunctionProperty: Encodable {
    let type: String
    let description: String
}
