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
    
    @State var textfieldInput: String = ""
    
    @State var opacoty_text: Double = 0.0
    
    @State var result: CurrencyExchange?
    
    var outputResult: String{
        if result == nil{
            return "0"
        }
        return String(result!.result)
    }
    //MARK: Computing property
    var body: some View {
        NavigationView{
            VStack{
                TextField("input", text: $textfieldInput)
                    
                HStack{
                    Text(textfieldInput)
                    Spacer()
                    
                    Picker(selection: $selectedFromCurrency, label: Text("Exchange currency to"), content: {
                        Text("USD").tag("USD")
                        Text("EUR").tag("EUR")
                        Text("JPY").tag("JPY")
                        Text("GBP").tag("GBP")
                        Text("AUD").tag("AUD")
                        Text("CAD").tag("CAD")
                        Text("CHF").tag("CHF")
                        Text("CNY").tag("CNY")
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
                        Text("CNY").tag("CNY")
                        Text("HKD").tag("HKD")
                        Text("NZD").tag("NZD")
                    })
                    .pickerStyle(.wheel)
                }
                Button(action: {
                    Task{
                        
                        result = await NetWorkServices.fetch(to: selectedToCurrency, from: selectedFromCurrency, amount: textfieldInput)
                    }
                }, label: {
                    Text("Convert")
                })
                .buttonStyle(.borderedProminent)
                
               
                if let result = result{
                    Text("\(String(result.result)) \(selectedToCurrency)")
                }else{
                    ProgressView()
                }
                
            }
        }.navigationTitle("Currency Exchange")
        
    }
}

struct CurrencyView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            CurrencyView()
        }
    }
}
