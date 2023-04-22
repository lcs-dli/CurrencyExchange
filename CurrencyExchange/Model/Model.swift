//
//  Model.swift
//  CurrencyExchange
//
//  Created by David Li on 2023-04-20.
//

import Foundation

struct CurrencyExchange: Codable{
    let date:String
    let result: Double
    let success: Bool
    let info: info
    let query: Query
}
