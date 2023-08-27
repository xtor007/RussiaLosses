//
//  MainLossesTableDelegate.swift
//  RussiaLosses
//
//  Created by Anatoliy Khramchenko on 27.08.2023.
//

import UIKit

class MainLossesTableDelegate: NSObject, UITableViewDelegate {

    let action: (Int) -> Void

    init(didSelectRow action: @escaping (Int) -> Void) {
        self.action = action
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        action(indexPath.row)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return MainConstants.tableCellHeight
    }

}
