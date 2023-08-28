//
//  LossesCategory.swift
//  RussiaLosses
//
//  Created by Anatoliy Khramchenko on 28.08.2023.
//

import Foundation

enum LossesCategory: CaseIterable {

    static var prevLossesValues = [LossesCategory: Int]()

    var title: String {
        switch self {
        case .personnel:
            return Strings.Category.personnel
        case .aircraft:
            return Strings.Category.aircraft
        case .helicopter:
            return Strings.Category.helicopter
        case .tank:
            return Strings.Category.tank
        case .APC:
            return Strings.Category.apc
        case .fieldArtillery:
            return Strings.Category.fieldArtillery
        case .MRL:
            return Strings.Category.mrl
        case .militaryAuto:
            return Strings.Category.militaryAuto
        case .fuelTank:
            return Strings.Category.fuelTank
        case .drone:
            return Strings.Category.drone
        case .navalShip:
            return Strings.Category.navalShip
        case .antiAircreftWarfare:
            return Strings.Category.antiAircreftWarfarev
        case .specialEquipment:
            return Strings.Category.specialEquipment
        case .mobileSRBMSystem:
            return Strings.Category.mobileSRBMSystem
        case .vehiclesAndFuelTanks:
            return Strings.Category.vehiclesAndFuelTanks
        case .cruiseMissiles:
            return Strings.Category.cruiseMissiles
        }
    }

    var emoji: String {
        switch self {
        case .personnel:
            return "🧑‍🚀"
        case .aircraft:
            return "🛫"
        case .helicopter:
            return "🚁"
        case .tank:
            return "🚜"
        case .APC:
            return "🛺"
        case .fieldArtillery:
            return "🏹"
        case .MRL:
            return "🎯"
        case .militaryAuto:
            return "🚔"
        case .fuelTank:
            return "🛺"
        case .drone:
            return "🩴"
        case .navalShip:
            return "🛳"
        case .antiAircreftWarfare:
            return "🔫"
        case .specialEquipment:
            return "💂‍♀️"
        case .mobileSRBMSystem:
            return "🎯"
        case .vehiclesAndFuelTanks:
            return "🚜"
        case .cruiseMissiles:
            return "🚀"
        }
    }

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
