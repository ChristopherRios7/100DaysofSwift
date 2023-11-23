//
//  Resort.swift
//  SnowSeeker
//
//  Created by Christopher Rios on 11/19/23.
//

import Foundation

struct Resort: Codable, Identifiable {
    let id: String
    let name: String
    let country: String
    let description: String
    let imageCredit: String
    let price: Int
    let size: Int
    let snowDepth: Int
    let elevation: Int
    let runs: Int
    let facilities: [String]
    
    
    ///Alternate Code:
    ///static let allResorts: [Resort] = Bundle.main.decode("resorts.json")
    ///static let example = allResorts[0]
    
    static let example = (Bundle.main.decode("resorts.json") as [Resort])[0]
    
    var facilityTypes: [Facility] {
        facilities.map(Facility.init)
    }
}