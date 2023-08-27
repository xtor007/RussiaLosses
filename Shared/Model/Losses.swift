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

enum LossesCategory: CaseIterable {

    static var prevLossesValues = [LossesCategory: Int]()

    case personnel, aircraft, helicopter, tank, APC, fieldArtillery, MRL, militaryAuto,
         fuelTank, drone, navalShip, antiAircreftWarfare, specialEquipment, mobileSRBMSystem,
         vehiclesAndFuelTanks, cruiseMissiles

    func fetchData(from obj: LossesEquipment) -> CategoryLosses? {

        let prevValue = LossesCategory.prevLossesValues[self]
        var value: Int?

        switch self {
        case .personnel:
            return nil
        case .aircraft:
            value = obj.aircraft
        case .helicopter:
            value = obj.helicopter
        case .tank:
            value = obj.tank
        case .APC:
            value = obj.APC
        case .fieldArtillery:
            value = obj.fieldArtillery
        case .MRL:
            value = obj.MRL
        case .militaryAuto:
            value = obj.militaryAuto
        case .fuelTank:
            value = obj.fuelTank
        case .drone:
            value = obj.drone
        case .navalShip:
            value = obj.navalShip
        case .antiAircreftWarfare:
            value = obj.antiAircraftWarfare
        case .specialEquipment:
            value = obj.specialEquipment
        case .mobileSRBMSystem:
            value = obj.mobileSRBMSystem
        case .vehiclesAndFuelTanks:
            value = obj.vehiclesAndFuelTanks
        case .cruiseMissiles:
            value = obj.cruiseMissiles
        }

        
        guard let value else {
            return nil
        }
        LossesCategory.prevLossesValues[self] = value
        return CategoryLosses(category: self, losses: value, lossDifference: value - prevValue)

    }

}
