//
//  StatisticTableViewDelegate.swift
//  RussiaLosses
//
//  Created by Anatoliy Khramchenko on 28.08.2023.
//

import UIKit

class StatisticTableViewDelegate: NSObject, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return StatisticConstants.cellHeight
    }
}
