//
//  ModifiersView.swift
//  PhotoAlbum
//
//  Created by Christopher Rios on 10/31/23.
//

import SwiftUI


struct DrawImageNameView: View {
    var text: String
    var textResults: String
    
    var body: some View {
        HStack {
            Text(text)
                .foregroundColor(Color.green)
                .modifier(DrawText())
            
            Text(textResults)
                .modifier(DrawText())
                .foregroundColor(Color.red)
        }
    }
}


struct DrawText: ViewModifier {
    let font = Font.system(size: 22, weight: .heavy, design: .default)
    
    func body(content: Content) -> some View {
        content
            .font(font)
        
    }
}

struct DrawPlusButton: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.black.opacity(0.75))
            .foregroundColor(.white)
            .font(.title)
            .clipShape(Circle())
            .padding(.trailing)
    }
}

