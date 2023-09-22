//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Christopher Rios on 9/21/23.
//

import Foundation

struct ExpenseItem: Identifiable, Codable{
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
