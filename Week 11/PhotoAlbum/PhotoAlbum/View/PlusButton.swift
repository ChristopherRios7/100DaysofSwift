//
//  PlusButton.swift
//  PhotoAlbum
//
//  Created by Christopher Rios on 10/31/23.
//

import SwiftUI
import MapKit

struct PlusButtonView: View {
    
    @Binding var locations: [CodableMKPointAnnotation]
    @Binding var centerCoordinate: CLLocationCoordinate2D
    
    var imageName: String
    
    
    
    var body: some View {
        Button(action: {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                // create a new location
            let newLocation = CodableMKPointAnnotation()
            newLocation.coordinate = self.centerCoordinate
            newLocation.title = "Location for Photo with name: \(self.imageName)"
            newLocation.subtitle = "Location added: \(formatter.string(from: Date()))"
            self.locations.append(newLocation)
        }) {
            Image(systemName: "plus")
        }
        .modifier(DrawPlusButton())
        
    }
}

//#Preview {
//    PlusButton()
//}
