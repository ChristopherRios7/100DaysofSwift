//
//  String-EmptyChecking.swift
//  CupcakeCorner
//
//  Created by Christopher Rios on 10/6/23.
//

import Foundation

extension String {
    var isReallyEmpty: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
