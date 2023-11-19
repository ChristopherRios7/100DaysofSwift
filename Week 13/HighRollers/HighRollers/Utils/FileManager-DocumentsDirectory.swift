//
//  FileManager-DocumentsDirectory.swift
//  HighRollers
//
//  Created by Christopher Rios on 11/18/23.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
