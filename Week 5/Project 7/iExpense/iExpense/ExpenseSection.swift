//
//  ExpenseSection.swift
//  iExpense
//
//  Created by Christopher Rios on 9/22/23.
//

import SwiftUI

struct ExpenseSection: View {
    let title: String
    let expenses: [ExpenseItem]
    let deleteItems: (IndexSet) -> Void
    var body: some View {
        Section(title) {
        ForEach(expenses) { item in
                HStack {
                    VStack(alignment: .leading) {
                        Text(item.name)
                            .font(.headline)
                        Text(item.type)
                    }
                    
                    Spacer()
                    
                    Text(item.amount, format: .localCurrency)
                        .style(for: item)
                }
                .accessibilityElement()
                .accessibilityLabel("\(item.name), \(item.amount.formatted(.currency(code: "USD")))")
                .accessibilityHint(item.type)
            }
            .onDelete(perform: deleteItems)
        }
    }
}

#Preview {
    ExpenseSection(title: "Personal", expenses: [] ) { _ in }
}
