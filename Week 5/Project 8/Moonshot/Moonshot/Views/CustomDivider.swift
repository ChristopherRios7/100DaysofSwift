//
//  CustomDivider.swift
//  Moonshot
//
//  Created by Christopher Rios on 9/26/23.
//

import SwiftUI

struct CustomDivider: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundColor(.lightBackground)
            .padding(.vertical)
    }
}

#Preview {
    CustomDivider()
}
