//
//  Picture.swift
//  PhotoAlbum
//
//  Created by Christopher Rios on 10/31/23.
//

import Foundation

struct Picture: Codable, Identifiable {
    var id: UUID
    var pictureName: String
    var locations: [CodableMKPointAnnotation]
    
    }
