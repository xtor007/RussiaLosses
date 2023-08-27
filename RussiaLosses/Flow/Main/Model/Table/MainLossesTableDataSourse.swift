//
//  MainLossesTableDataSourse.swift
//  RussiaLosses
//
//  Created by Anatoliy Khramchenko on 27.08.2023.
//

import UIKit

class MainLossesTableDataSourse: NSObject, UITableViewDataSource {

    private let data: [Losses]

    init(losses data: [Losses]) {
        self.data = data
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LossesCell.cellId, for: indexPath) as? LossesCell else {
            return UITableViewCell()
        }
        cell.setupData(data[indexPath.row])
        return cell
    }

}
