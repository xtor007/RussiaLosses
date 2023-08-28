//
//  StatisticCell.swift
//  RussiaLosses
//
//  Created by Anatoliy Khramchenko on 28.08.2023.
//

import UIKit
import SnapKit

class StatisticCell: UITableViewCell {

    static let cellId = "kStatisticCell"

    private var statisticLabel: UILabel!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        makeUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func makeUI() {
        backgroundColor = .clear
        setupStatisticLabel()
    }

    private func setupStatisticLabel() {
        statisticLabel = UILabel()
        statisticLabel.textColor = Asset.Colors.foregroundColor.color
        statisticLabel.font = .systemFont(ofSize: StatisticConstants.textSize)
        statisticLabel.numberOfLines = 1
        contentView.addSubview(statisticLabel)
        statisticLabel.snp.makeConstraints { make in
            make.leading.equalTo(StatisticConstants.horizontalPadding)
            make.trailing.equalTo(-StatisticConstants.horizontalPadding)
            make.centerY.equalToSuperview()
        }
    }

    func setupData(_ data: CategoryLosses) {
        let differance = data.lossDifference ?? 0
        let differanceText = differance == 0 ? "" : "(+\(differance))"
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let losses = numberFormatter.string(from: NSNumber(value: data.losses)) ?? "0"
        statisticLabel.text = "\(data.category.emoji) \(data.category.title): \(losses)\(differanceText)"
    }

}
