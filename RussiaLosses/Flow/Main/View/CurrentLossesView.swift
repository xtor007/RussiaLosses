//
//  CurrentLossesView.swift
//  RussiaLosses
//
//  Created by Anatoliy Khramchenko on 27.08.2023.
//

import UIKit
import SnapKit

class CurrentLossesView: UIView {

    // MARK: Attributes

    private let united24Link = "https://u24.gov.ua/"

    private let losses: Int

    private var lossesLabel: UILabel!
    private var helpIncreaseLabel: UILabel!

    // MARK: Life

    init(losses: Int) {
        self.losses = losses
        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        makeUI()
    }

    // MARK: UI

    private func makeUI() {
        backgroundColor = Asset.Colors.darkMilitaryColor.color
        setupHelpIncrease()
        setupLossesView()
    }

    private func setupHelpIncrease() {
        helpIncreaseLabel = UILabel()
        let underlineAttributes: [NSAttributedString.Key: Any] = [
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        let underlinedText = NSAttributedString(string: Strings.Main.helpIncrease, attributes: underlineAttributes)
        helpIncreaseLabel.attributedText = underlinedText
        helpIncreaseLabel.textColor = Asset.Colors.linkColor.color
        helpIncreaseLabel.font = .systemFont(ofSize: 18)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(linkTap(_:)))
        helpIncreaseLabel.addGestureRecognizer(tapGesture)
        helpIncreaseLabel.isUserInteractionEnabled = true
        addSubview(helpIncreaseLabel)
        helpIncreaseLabel.snp.makeConstraints { make in
            make.leading.equalTo(HeaderConstants.horizontalPadding)
            make.trailing.equalTo(-HeaderConstants.horizontalPadding)
            make.bottom.equalTo(-HeaderConstants.distanceBetweenElements)
        }
    }

    private func setupLossesView() {
        lossesLabel = UILabel()
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        lossesLabel.text = numberFormatter.string(from: NSNumber(value: losses))
        lossesLabel.textColor = Asset.Colors.foregroundColor.color
        lossesLabel.font = .boldItalicSystemFont(ofSize: 70)
        lossesLabel.numberOfLines = 1
        addSubview(lossesLabel)
        lossesLabel.snp.makeConstraints { make in
            make.leading.equalTo(HeaderConstants.horizontalPadding)
            make.trailing.equalTo(-HeaderConstants.horizontalPadding)
            make.bottom.equalTo(helpIncreaseLabel.snp.top).offset(-HeaderConstants.distanceBetweenElements)
        }
    }

    // MARK: Actions

    @objc func linkTap(_ sender: UITapGestureRecognizer) {
        guard let url = URL(string: united24Link), UIApplication.shared.canOpenURL(url) else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }

}
