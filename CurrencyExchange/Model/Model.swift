//
//  Model.swift
//  CurrencyExchange
//
//  Created by David Li on 2023-04-20.
//

import Foundation

struct CurrencyExchange: Identifiable, Codable{
    let from: String
    let to: String
    let amount: String
    let result: String
    let id: Int
}
