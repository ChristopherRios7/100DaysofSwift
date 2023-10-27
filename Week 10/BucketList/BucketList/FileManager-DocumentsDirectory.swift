//
//  FileManager-DocumentsDirectory.swift
//  BucketList
//
//  Created by Christopher Rios on 10/26/23.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
