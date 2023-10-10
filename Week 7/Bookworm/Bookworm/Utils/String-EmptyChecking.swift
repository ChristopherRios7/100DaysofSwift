//
//  String-EmptyChecking.swift
//  Bookworm
//
//  Created by Christopher Rios on 10/10/23.
//

import Foundation

extension String {
    var isReallyEmpty: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
