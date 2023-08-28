//
//  Losses.swift
//  RussiaLosses
//
//  Created by Anatoliy Khramchenko on 25.08.2023.
//

import Foundation

struct Losses {
    let date: Date
    let day: Int
    let personnelLosses: CategoryLosses
    let equipmentsLosses: [CategoryLosses]
    let greatestLossesDirection: String?
}

struct CategoryLosses {
    let category: LossesCategory
    let losses: Int
    let lossDifference: Int?
}
