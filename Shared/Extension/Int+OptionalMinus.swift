//
//  Int+OptionalMinus.swift
//  RussiaLosses
//
//  Created by Anatoliy Khramchenko on 25.08.2023.
//

import Foundation

extension Int? {
    static func -(lhs: Int, rhs: Int?) -> Int? {
        guard let rhs else {
            return nil
        }
        return lhs - rhs
    }
}
