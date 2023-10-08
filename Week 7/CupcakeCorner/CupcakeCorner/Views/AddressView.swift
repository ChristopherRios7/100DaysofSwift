//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Christopher Rios on 10/4/23.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var order: SharedOrder
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.name)
                TextField("Street Address", text: $order.streetAddress)
                TextField("City", text: $order.city)
                TextField("Zip", text: $order.zip)
            }
            
            Section {
                NavigationLink {
                    CheckoutView(order: order)
                } label: {
                    Text("Check out")
                }
            }
            .disabled(order.hasValidAddress == false)
        }
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationView{
        AddressView(order: SharedOrder())
    }
}
