//
//  DataService.swift
//  RussiaLosses
//
//  Created by Anatoliy Khramchenko on 24.08.2023.
//

import Foundation

class DataService {

    private let personnelLink = "https://raw.githubusercontent.com/MacPaw/2022-Ukraine-Russia-War-Dataset/main/data/russia_losses_personnel.json"
    private let equipmentLink = "https://raw.githubusercontent.com/MacPaw/2022-Ukraine-Russia-War-Dataset/main/data/russia_losses_equipment.json"

    func fetchDataFromInet(completionHandler: @escaping (Result<[Losses], Error>) -> Void) {
        Task {
            do {

                let personnelReqest = try makeReqest(forLink: personnelLink)
                let personnelNetworkService = NetworkService(request: personnelReqest)
                let personnelData: [LossesPersonnel] = try await personnelNetworkService.makeRequest()

                let equipmentRequest = try makeReqest(forLink: equipmentLink)
                let equipmentNetworkService = NetworkService(request: equipmentRequest)
                let equipmentData: [LossesEquipment] = try await equipmentNetworkService.makeRequest()

                let losses = try combineData(personnelData: personnelData, equipmentData: equipmentData)
                DispatchQueue.main.async {
                    completionHandler(.success(losses))
                }

            } catch {
                DispatchQueue.main.async {
                    completionHandler(.failure(error))
                }
            }
        }
    }

    private func combineData(personnelData: [LossesPersonnel], equipmentData: [LossesEquipment]) throws -> [Losses] {

        let personnelData = personnelData.sorted(by: { $0.day < $1.day })
        let equipmentData = equipmentData.sorted(by: { $0.day < $1.day })
        guard !personnelData.isEmpty && !equipmentData.isEmpty else {
            throw DataError.emptyData
        }

        var result = [Losses]()

        var personnelIterator = personnelData.makeIterator()
        var equipmentIterator = equipmentData.makeIterator()
        var lastPersonnel: Int?
        while let personnelLosses = personnelIterator.next() {
            let day = personnelLosses.day
            let date = try makeDate(from: personnelLosses.date)
            let personnel = CategoryLosses(category: .personnel, losses: personnelLosses.personnel, lossDifference: personnelLosses.personnel - lastPersonnel)
            lastPersonnel = personnelLosses.personnel
            var equipments = [CategoryLosses]()
            var greatestLossesDirection: String?
            while let equipmentLosses = equipmentIterator.next() {
                if equipmentLosses.day < day {
                    continue
                }
                if equipmentLosses.day == day {
                    equipments = transformLosses(equipmentLosses)
                    greatestLossesDirection = equipmentLosses.greatestLossesDirection
                }
                break
            }
            result.append(Losses(
                date: date,
                day: day,
                personnelLosses: personnel,
                equipmentsLosses: equipments,
                greatestLossesDirection: greatestLossesDirection
            ))
        }
        return result

    }

    private func makeReqest(forLink link: String) throws -> URLRequest {
        guard let url = URL(string: link) else {
            throw DataError.failedLink
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        return request
    }

    private func makeDate(from string: String) throws -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let date = dateFormatter.date(from: string) {
            return date
        } else {
            throw DataError.cantConvertDate
        }
    }
    
    private func transformLosses(_ losses: LossesEquipment) -> [CategoryLosses] {
        return LossesCategory.allCases.compactMap({ $0.fetchData(from: losses) })
    }

}
