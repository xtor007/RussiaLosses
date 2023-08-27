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
    }

    private func setupHeader() {
        headerView = CurrentLossesView(losses: viewModel.losses.last!.personnelLosses.losses)
        view.addSubview(headerView)
        headerView.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
            make.height.equalTo(MainConstants.headerHeight)
        }
    }

}
