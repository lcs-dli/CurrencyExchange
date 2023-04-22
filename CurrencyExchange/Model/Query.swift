//
//  Query.swift
//  CurrencyExchange
//
//  Created by David Li on 2023-04-22.
//

import Foundation

struct Query: Codable{
    let amount: Double
    let from: String
    let to: String
}
