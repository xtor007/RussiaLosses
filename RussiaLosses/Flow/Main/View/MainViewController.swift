//
//  MainViewController.swift
//  RussiaLosses
//
//  Created by Anatoliy Khramchenko on 27.08.2023.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {

    // MARK: Attributes

    private let viewModel: MainViewModel

    private var headerView: CurrentLossesView!
    private var lossesTable: UITableView!

    private lazy var tableDelegate = MainLossesTableDelegate(didSelectRow: cellTap(_:))
    private lazy var tableDataSource = MainLossesTableDataSourse(losses: viewModel.losses)

    // MARK: Life

    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        makeUI()
    }

    // MARK: UI

    private func setupBackground() {
        view.backgroundColor = Asset.Colors.militaryColor.color
    }

    private func makeUI() {
        setupHeader()
        setupTableView()
    }

    private func setupHeader() {
        headerView = CurrentLossesView(losses: viewModel.losses.first!.personnelLosses.losses)
        view.addSubview(headerView)
        headerView.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
            make.height.equalTo(MainConstants.headerHeight)
        }
    }

    private func setupTableView() {
        lossesTable = UITableView()
        lossesTable.backgroundColor = .clear
        lossesTable.separatorColor = .clear
        lossesTable.showsVerticalScrollIndicator = false
        lossesTable.register(LossesCell.self, forCellReuseIdentifier: LossesCell.cellId)
        lossesTable.delegate = tableDelegate
        lossesTable.dataSource = tableDataSource
        view.addSubview(lossesTable)
        lossesTable.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(headerView.snp.bottom).offset(MainConstants.tableVerticalPadding)
            make.bottom.equalTo(-MainConstants.tableVerticalPadding)
        }
    }

    // MARK: Actions

    private func cellTap(_ cellIndex: Int) {
        print(cellIndex)
    }

}
