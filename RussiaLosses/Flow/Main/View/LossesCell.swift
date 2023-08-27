//
//  LossesCell.swift
//  RussiaLosses
//
//  Created by Anatoliy Khramchenko on 27.08.2023.
//

import UIKit
import SnapKit

class LossesCell: UITableViewCell {

    static let cellId = "kLossesCell"

    private var backgroundTile: UIView!
    private var dateLabel: UILabel!
    private var differanceLabel: UILabel!

    private let emojies = ["😁", "😇", "🙄", "👊", "💪", "🍺", "🎯", "💣", "🎉", "🎊"]

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        makeUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func makeUI() {
        backgroundColor = .clear
        setupBackgroundTile()
        setupDifferanceLabel()
        setupDateLabel()
    }

    private func setupBackgroundTile() {
        backgroundTile = UIView()
        backgroundTile.backgroundColor = Asset.Colors.foregroundColor.color
        backgroundTile.layer.cornerRadius = LossesTableConstants.cornerRadius
        backgroundTile.layer.shadowColor = UIColor.black.cgColor
        backgroundTile.layer.shadowOffset = CGSize(width: LossesTableConstants.shadowOffset, height: LossesTableConstants.shadowOffset)
        backgroundTile.layer.shadowOpacity = LossesTableConstants.shadowOpacity
        backgroundTile.layer.shadowRadius = LossesTableConstants.shadowRadis
        contentView.addSubview(backgroundTile)
        backgroundTile.snp.makeConstraints { make in
            make.leading.equalTo(LossesTableConstants.horizontalPadding)
            make.trailing.equalTo(-LossesTableConstants.horizontalPadding)
            make.top.equalTo(LossesTableConstants.distanceBetweenCells / 2)
            make.bottom.equalTo(-LossesTableConstants.distanceBetweenCells / 2)
        }
    }

    private func setupDifferanceLabel() {
        differanceLabel = UILabel()
        differanceLabel.textColor = .black
        differanceLabel.font = .boldSystemFont(ofSize: LossesTableConstants.bigFontSize)
        differanceLabel.numberOfLines = 1
        backgroundTile.addSubview(differanceLabel)
        differanceLabel.snp.makeConstraints { make in
            make.leading.equalTo(LossesTableConstants.horizontalPadding)
            make.trailing.equalTo(-LossesTableConstants.horizontalPadding)
            make.bottom.equalTo(-LossesTableConstants.cellVerticalInsidePadding)
        }
    }

    private func setupDateLabel() {
        dateLabel = UILabel()
        dateLabel.textColor = .systemGray3
        dateLabel.font = .systemFont(ofSize: LossesTableConstants.smallFontSize)
        dateLabel.numberOfLines = 1
        dateLabel.textAlignment = .right
        backgroundTile.addSubview(dateLabel)
        dateLabel.snp.makeConstraints { make in
            make.leading.equalTo(LossesTableConstants.horizontalPadding)
            make.trailing.equalTo(-LossesTableConstants.horizontalPadding)
            make.top.equalTo(LossesTableConstants.cellVerticalInsidePadding)
        }
    }

    func setupData(_ data: Losses) {
        let differance = data.personnelLosses.lossDifference ?? 0
        differanceLabel.text = "+\(differance) \(makeEmoji(differance))"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        dateLabel.text = dateFormatter.string(from: data.date)
    }

    private func makeEmoji(_ differance: Int) -> String {
        guard differance > 0 else {
            return ""
        }
        return emojies.randomElement()!
    }

}
