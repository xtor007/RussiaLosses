//
//  LoadingViewController.swift
//  RussiaLosses
//
//  Created by Anatoliy Khramchenko on 23.08.2023.
//

import UIKit
import SnapKit

class LoadingViewController: UIViewController {

    // MARK: Attributes

    private var activityIndicator: UIActivityIndicatorView!
    private var loadingLabel: UILabel!
    private var messageLabel: UILabel!

    // MARK: Life

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        makeUI()
        startLoading()
    }

    override func viewDidDisappear(_ animated: Bool) {
        stopLoading()
    }

    // MARK: UI

    private func setupBackground() {
        view.backgroundColor = Asset.Colors.militaryColor.color
    }

    private func makeUI() {
        makeActivityIndicastor()
        makeLoadingLabel()
        makeMessageLabel()
    }

    private func makeActivityIndicastor() {
        activityIndicator = UIActivityIndicatorView()
        activityIndicator.color = Asset.Colors.foregroundColor.color
        activityIndicator.style = .medium
        view.addSubview(activityIndicator)
        activityIndicator.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }

    private func makeLoadingLabel() {
        loadingLabel = UILabel()
        loadingLabel.text = Strings.Loading.loading
        loadingLabel.font = .boldSystemFont(ofSize: LoadingConstants.loadingFontSize)
        loadingLabel.textColor = Asset.Colors.foregroundColor.color
        loadingLabel.textAlignment = .center
        view.addSubview(loadingLabel)
        loadingLabel.snp.makeConstraints { make in
            make.leading.equalTo(LoadingConstants.horizontalPaddings)
            make.trailing.equalTo(-LoadingConstants.horizontalPaddings)
            make.top.equalTo(activityIndicator.snp.bottom).offset(LoadingConstants.spacingBetweenElements)
        }
    }

    private func makeMessageLabel() {
        messageLabel = UILabel()
        messageLabel.text = Strings.Loading.message
        messageLabel.font = .systemFont(ofSize: LoadingConstants.messageFontSize)
        messageLabel.textColor = Asset.Colors.foregroundColor.color
        messageLabel.textAlignment = .center
        messageLabel.numberOfLines = 2
        view.addSubview(messageLabel)
        messageLabel.snp.makeConstraints { make in
            make.leading.equalTo(LoadingConstants.horizontalPaddings)
            make.trailing.equalTo(-LoadingConstants.horizontalPaddings)
            make.top.equalTo(loadingLabel.snp.bottom).offset(LoadingConstants.spacingBetweenElements)
        }
    }

    // MARK: Methods

    private func startLoading() {
        activityIndicator.startAnimating()
    }

    private func stopLoading() {
        activityIndicator.stopAnimating()
    }

}
