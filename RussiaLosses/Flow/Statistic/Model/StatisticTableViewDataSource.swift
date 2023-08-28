//
//  StatisticTableViewDataSource.swift
//  RussiaLosses
//
//  Created by Anatoliy Khramchenko on 28.08.2023.
//

import UIKit

class StatisticTableViewDataSource: NSObject, UITableViewDataSource {

    private let data: Losses

    init(_ data: Losses) {
        self.data = data
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.equipmentsLosses.count + 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StatisticCell.cellId, for: indexPath) as? StatisticCell else {
            return UITableViewCell()
        }
        let categoryLosses = indexPath.row == 0 ? data.personnelLosses : data.equipmentsLosses[indexPath.row - 1]
        cell.setupData(categoryLosses)
        return cell
    }

}
