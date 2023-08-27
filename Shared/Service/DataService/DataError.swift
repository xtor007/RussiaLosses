//
//  DataError.swift
//  RussiaLosses
//
//  Created by Anatoliy Khramchenko on 24.08.2023.
//

import Foundation

enum DataError: Error {
    case failedLink, emptyData, cantConvertDate
}
