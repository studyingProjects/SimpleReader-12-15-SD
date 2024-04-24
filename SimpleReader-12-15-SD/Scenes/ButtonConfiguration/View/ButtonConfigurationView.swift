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
    // MARK: - View Model Properties
    private var timeString: String? {
        didSet {
            startButton.setNeedsUpdateConfiguration()
        }
    }
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
    // MARK: - Buttons
    private lazy var startButton: UIButton = {
        let button = UIButton.getDefaultFilledButton(
            title: "Start",
            isDefaultImageConfig: true,
            action: UIAction(handler: { action in
                let button = action.sender as? UIButton

                guard let isSelected = button?.isSelected else {
                    return
                }

                button?.isSelected = !isSelected
            })
        )

        button.configurationUpdateHandler = getStartButtonConfigUpdateHandler(button)

        return button
    }()

    private lazy var stopButton = UIButton.getDefaultFilledButton(
        title: "Stop",
        isDefaultImageConfig: true,
        action: nil
    )

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

    // MARK: - Setup subviews
    private func setupSubViews() {
        buttonsStackView.addArrangedSubview(startButton)
        buttonsStackView.addArrangedSubview(stopButton)
    }

    private func getStartButtonConfigUpdateHandler(_ button: UIButton)
    -> (_ button: UIButton) -> Void {
        return { [unowned self] button in
            var config = button.configuration
            let isSelected = button.isSelected

            if isSelected {
                config?.image = UIImage(systemName: "pause.fill")
                config?.title = "Pause"
                config?.subtitle = timeString
                config?.titlePadding = Sizes.Small.padding
                config?.showsActivityIndicator = true
            } else {
                config?.image = UIImage(systemName: "play.fill")
                config?.title = "Play"
                config?.subtitle = nil
                config?.titlePadding = 0
                config?.showsActivityIndicator = false
            }

            button.configuration = config
        }
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
