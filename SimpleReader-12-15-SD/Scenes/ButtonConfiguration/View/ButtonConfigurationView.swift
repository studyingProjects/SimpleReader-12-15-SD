//
//  ButtonConfigurationView.swift
//  SimpleReader-12-15-SD
//
//  Created by Andrei Shpartou on 23/04/2024.
//

import UIKit

protocol ButtonConfigurationProtocol {
}

class ButtonConfigurationView: UIView, ButtonConfigurationProtocol {
    // MARK: - View Properties
    private lazy var stopWatchLabel = UILabel(
        text: "Stopwatch is ready to start",
        font: .appLargeBold,
        textColor: .label,
        textAlignment: .center
    )

    private lazy var buttonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = Sizes.Medium.padding
        stackView.alignment = .center
        stackView.distribution = .fillEqually

        return stackView
    }()

    private lazy var startButton: UIButton = {
        let button = UIButton()
        button.setTitle("Start", for: .normal)
        button.titleLabel?.font = .appMediumBold
        button.backgroundColor = .greenButton
        button.layer.cornerRadius = Sizes.Medium.cornerRadius
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    private lazy var stopButton: UIButton = {
        let button = UIButton()
        button.setTitle("Stop", for: .normal)
        button.titleLabel?.font = .appMediumBold
        button.backgroundColor = .greenButton
        button.layer.cornerRadius = Sizes.Medium.cornerRadius
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup View
    private func setupView() {
        backgroundColor = .primarySystemBackground

        addSubviews(stopWatchLabel, buttonsStackView)

        setupSubViews()
    }

    private func setupSubViews() {
        buttonsStackView.addArrangedSubview(startButton)
        buttonsStackView.addArrangedSubview(stopButton)
    }
}

// MARK: - Constraints
private extension ButtonConfigurationView {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            // stopWatchLabel
            stopWatchLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            stopWatchLabel.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            stopWatchLabel.topAnchor.constraint(
                equalTo: safeAreaLayoutGuide.topAnchor,
                constant: Sizes.XLarge.padding
            ),
            // buttonsStackView
            buttonsStackView.leadingAnchor.constraint(
                equalTo: layoutMarginsGuide.leadingAnchor
            ),
            buttonsStackView.trailingAnchor.constraint(
                equalTo: layoutMarginsGuide.trailingAnchor
            ),
            buttonsStackView.bottomAnchor.constraint(
                equalTo: safeAreaLayoutGuide.bottomAnchor,
                constant: -Sizes.XLarge.padding
            ),
            startButton.heightAnchor.constraint(equalToConstant: Sizes.Medium.height),
            stopButton.heightAnchor.constraint(equalToConstant: Sizes.Medium.height)
        ])
    }
}
