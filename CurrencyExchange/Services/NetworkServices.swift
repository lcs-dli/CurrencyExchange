//
//  NetworkServices.swift
//  CurrencyExchange
//
//  Created by David Li on 2023-04-20.
//

import Foundation

struct NetWorkServices{
    
    static func fetch(to:String, from:String, amount:String) async -> CurrencyExchange?{
        
        
        let endpoint = "https://api.apilayer.com/exchangerates_data/convert?to=\(to)&from=\(from)&amount=\(amount)"
        
        var request = URLRequest(url: URL(string: endpoint)!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        request.addValue("ulbW3YCCAmMs3E9q1CT3K3ZolOL8hNHq", forHTTPHeaderField: "apikey")
        
        do {
            
            
            let (data, _) = try await URLSession.shared.data(from: URL(string: endpoint)!)
            
            
            let decoder = JSONDecoder()
            
            let decodedData = try decoder.decode(CurrencyExchange.self, from: data)

            return decodedData
            
        } catch {
            
            print("Count not retrieve data from endpoint, or could not decode into an instance of a Swift data type.")
            print("----")
            
            print(error.localizedDescription)
            return nil
            
        }
    }
}
