//
//  FileManager-DocumentsDirectory.swift
//  Flashzilla
//
//  Created by Christopher Rios on 11/13/23.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
