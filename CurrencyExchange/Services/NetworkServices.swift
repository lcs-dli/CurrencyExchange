//
//  NetworkServices.swift
//  CurrencyExchange
//
//  Created by David Li on 2023-04-20.
//
import Foundation

struct NetWorkServices {
    
    static func fetch(to: String, from: String, amount: String) async -> CurrencyExchange?{
        
       
        
        let endpoint = "https://api.apilayer.com/fixer/convert?to=\(to)&from=\(from)&amount=\(amount)"
        
        var request = URLRequest(url: URL(string: endpoint)!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        request.addValue("ulbW3YCCAmMs3E9q1CT3K3ZolOL8hNHq", forHTTPHeaderField: "apikey")
        
       
        
        do {
            
            // Fetch the data
            let (data, _) = try await URLSession.shared.data (for: request)
            
            // 3. Decode the data
            
            // Create a decoder object to do most of the work for us
            let decoder = JSONDecoder()
            
            // Use the decoder object to convert the raw data into an instance of our Swift data type
            let decodedData = try decoder.decode(CurrencyExchange.self, from: data)

            // If we got here, decoding succeeded, return the instance of our data type
            return decodedData
            
        } catch {
            
            // Show an error that we wrote and understand
            print("Count not retrieve data from endpoint, or could not decode into an instance of a Swift data type.")
            print("----")
            
            // Show the detailed error to help with debugging
            print(error.localizedDescription)
            return nil
            
        }
    }
}
