//
//  CurrencyView.swift
//  CurrencyExchange
//
//  Created by David Li on 2023-04-20.
//

import SwiftUI

struct CurrencyView: View {
    //MARK: Stored property
    @State private var selectedFromCurrency = "EUR"
    
    @State private var selectedToCurrency = "JPY"
    
    //MARK: Computing property
    var body: some View {
        VStack{
            HStack{
                Picker(selection: $selectedFromCurrency, label: Text("Exxchange currency to"), content: {
                    Text("USD").tag("USD")
                    Text("EUR").tag("EUR")
                    Text("JPY").tag("JPY")
                    Text("GBP").tag("GBP")
                    Text("AUD").tag("AUD")
                    Text("CAD").tag("CAD")
                    Text("CHF").tag("CHF")
                    Text("CNH").tag("CNH")
                    Text("HKD").tag("HKD")
                    Text("NZD").tag("NZD")
                })
                .pickerStyle(.wheel)
                
                Text("to")
                
                Picker(selection: $selectedToCurrency, label: Text("Exchange currency to"), content: {
                    Text("USD").tag("USD")
                    Text("EUR").tag("EUR")
                    Text("JPY").tag("JPY")
                    Text("GBP").tag("GBP")
                    Text("AUD").tag("AUD")
                    Text("CAD").tag("CAD")
                    Text("CHF").tag("CHF")
                    Text("CNH").tag("CNH")
                    Text("HKD").tag("HKD")
                    Text("NZD").tag("NZD")
                })
                .pickerStyle(.wheel)
                
                
            }
            
            
            
            
        }
        
        
        
    }
}

struct CurrencyView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyView()
    }
}
