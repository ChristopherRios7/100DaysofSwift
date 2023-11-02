//
//  CircleView.swift
//  PhotoAlbum
//
//  Created by Christopher Rios on 10/31/23.
//

import SwiftUI

struct CircleView: View {
    var body: some View {
        Circle()
            .fill(Color.blue)
            .opacity(0.3)
            .frame(width: 32, height: 32)
    }
}


#Preview {
    CircleView()
}
