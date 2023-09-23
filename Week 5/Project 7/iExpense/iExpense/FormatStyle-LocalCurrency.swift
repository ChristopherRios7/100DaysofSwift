//
//  FormatStyle-LocalCurrency.swift
//  iExpense
//
//  Created by Christopher Rios on 9/22/23.
//

import Foundation

extension FormatStyle where Self == FloatingPointFormatStyle<Double>.Currency {
    static var localCurrency: Self {
        .currency(code: Locale.current.currency?.identifier ?? "USD")
        
    }
}
