//
//  StatisticViewController.swift
//  RussiaLosses
//
//  Created by Anatoliy Khramchenko on 28.08.2023.
//

import UIKit
import SnapKit

class StatisticViewController: UIViewController {

    // MARK: Attributes

    private let statistic: Losses

    private var dateLabel: UILabel!
    private var mostLossesLabel: UILabel?
    private var statisticTable: UITableView!

    private var tableDelegate = StatisticTableViewDelegate()
    private lazy var tableDataSource = StatisticTableViewDataSource(statistic)

    // MARK: Life

    init(losses: Losses) {
        self.statistic = losses
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
    }

    // MARK: UI

    private func makeUI() {
        view.backgroundColor = Asset.Colors.militaryColor.color
        navigationController?.navigationBar.tintColor = Asset.Colors.foregroundColor.color
        setupDateLabel()
        setupMostLossesLabel()
        setupTableView()
    }

    private func setupDateLabel() {
        dateLabel = UILabel()
        dateLabel.textColor = Asset.Colors.foregroundColor.color
        dateLabel.font = .boldSystemFont(ofSize: StatisticConstants.dateFontSize)
        dateLabel.numberOfLines = 1
        dateLabel.textAlignment = .center
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        dateLabel.text = dateFormatter.string(from: statistic.date)
        view.addSubview(dateLabel)
        dateLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(StatisticConstants.topPadding)
        }
    }

    private func setupMostLossesLabel() {
        guard let mostLosses = statistic.greatestLossesDirection else {
            return
        }
        mostLossesLabel = UILabel()
        mostLossesLabel?.textColor = Asset.Colors.foregroundColor.color
        mostLossesLabel?.font = .systemFont(ofSize: StatisticConstants.mostLossesFontSize)
        mostLossesLabel?.numberOfLines = 1
        mostLossesLabel?.textAlignment = .center
        mostLossesLabel?.text = mostLosses
        view.addSubview(mostLossesLabel!)
        mostLossesLabel?.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(dateLabel.snp.bottom).offset(StatisticConstants.topPadding)
        }
    }

    private func setupTableView() {
        statisticTable = UITableView()
        statisticTable.backgroundColor = .clear
        statisticTable.separatorColor = Asset.Colors.foregroundColor.color
        statisticTable.showsVerticalScrollIndicator = false
        statisticTable.register(StatisticCell.self, forCellReuseIdentifier: StatisticCell.cellId)
        statisticTable.delegate = tableDelegate
        statisticTable.dataSource = tableDataSource
        view.addSubview(statisticTable)
        statisticTable.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            let topView: UIView = mostLossesLabel ?? dateLabel
            make.top.equalTo(topView.snp.bottom).offset(StatisticConstants.topPadding)
            make.bottom.equalTo(-StatisticConstants.bottomPadding)
        }
    }

}
