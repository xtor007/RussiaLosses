//
//  LossesEquipment.swift
//  RussiaLosses
//
//  Created by Anatoliy Khramchenko on 23.08.2023.
//

import Foundation

struct LossesEquipment: Codable {

    let date: String
    let day: Int
    let aircraft: Int?
    let helicopter: Int?
    let tank: Int?
    let APC: Int?
    let fieldArtillery: Int?
    let MRL: Int?
    let militaryAuto: Int?
    let fuelTank: Int?
    let drone: Int?
    let navalShip: Int?
    let antiAircraftWarfare: Int?
    let specialEquipment: Int?
    let mobileSRBMSystem: Int?
    let vehiclesAndFuelTanks: Int?
    let cruiseMissiles: Int?
    let greatestLossesDirection: String?

    enum CodingKeys: String, CodingKey {
        case date = "date"
        case day = "day"
        case aircraft = "aircraft"
        case helicopter = "helicopter"
        case tank = "tank"
        case APC = "APC"
        case fieldArtillery = "field artillery"
        case MRL = "MRL"
        case militaryAuto = "military auto"
        case fuelTank = "fuel tank"
        case drone = "drone"
        case navalShip = "naval ship"
        case antiAircraftWarfare = "anti-aircraft warfare"
        case specialEquipment = "special equipment"
        case mobileSRBMSystem = "mobile SRBM system"
        case vehiclesAndFuelTanks = "vehicles and fuel tanks"
        case cruiseMissiles = "cruise missiles"
        case greatestLossesDirection = "greatest losses direction"
    }

}
