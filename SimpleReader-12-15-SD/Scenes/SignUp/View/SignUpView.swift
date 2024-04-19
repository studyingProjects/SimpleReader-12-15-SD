//
//  SignUpView.swift
//  SimpleReader-12-15-SD
//
//  Created by Andrei Shpartou on 18/04/2024.
//

import UIKit

class SignUpView: UIView {
    // MARK: - Header Properties
    private lazy var signUpLabel = UILabel(
        text: "Sign Up",
        font: .appXLargeBold,
        textColor: .darkText
    )

    private lazy var enterDetailsLabel = UILabel(
        text: "Please enter your details",
        font: .appMedium,
        textColor: .secondaryLabel
    )

    // MARK: - Body Properties
    private lazy var nameLabel = UILabel(
        text: "Name",
        font: .appMediumBold,
        textColor: .darkText
    )

    private lazy var nameTextField = UIBorderedTextField(
        placeholder: "Name",
        font: .appMediumBold
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
    func setupView() {
        backgroundColor = .primarySystemBackground
        addSubviews(
            signUpLabel,
            enterDetailsLabel,
            nameLabel,
            nameTextField
        )

        setupSubViews()
    }

    func setupSubViews() {
    }
}
// MARK: - Constraints
private extension SignUpView {
    func setupConstraints() {
        setupHeader()
        setupBody()
        setupFooter()
    }
    // MARK: - Header
    func setupHeader() {
        NSLayoutConstraint.activate([
            // signUpLabel
            signUpLabel.leadingAnchor.constraint(
                equalTo: layoutMarginsGuide.leadingAnchor,
                constant: Sizes.Medium.padding
            ),
            signUpLabel.trailingAnchor.constraint(
                equalTo: layoutMarginsGuide.trailingAnchor,
                constant: -Sizes.Medium.padding
            ),
            signUpLabel.topAnchor.constraint(
                equalTo: safeAreaLayoutGuide.topAnchor,
                constant: Sizes.Medium.padding
            ),
            // enterDetailsLabel
            enterDetailsLabel.leadingAnchor.constraint(
                equalTo: layoutMarginsGuide.leadingAnchor,
                constant: Sizes.Medium.padding
            ),
            enterDetailsLabel.trailingAnchor.constraint(
                equalTo: layoutMarginsGuide.trailingAnchor,
                constant: -Sizes.Medium.padding
            ),
            enterDetailsLabel.topAnchor.constraint(
                equalTo: signUpLabel.bottomAnchor,
                constant: Sizes.Small.padding
            )
        ])
    }
    // MARK: - Body
    func setupBody() {
        NSLayoutConstraint.activate([
            // nameLabel
            nameLabel.leadingAnchor.constraint(
                equalTo: layoutMarginsGuide.leadingAnchor,
                constant: Sizes.Medium.padding
            ),
            nameLabel.trailingAnchor.constraint(
                equalTo: layoutMarginsGuide.trailingAnchor,
                constant: -Sizes.Medium.padding
            ),
            nameLabel.topAnchor.constraint(
                equalTo: enterDetailsLabel.bottomAnchor,
                constant: Sizes.Large.padding
            ),
            // nameTextField
            nameTextField.leadingAnchor.constraint(
                equalTo: layoutMarginsGuide.leadingAnchor,
                constant: Sizes.Medium.padding
            ),
            nameTextField.trailingAnchor.constraint(
                equalTo: layoutMarginsGuide.trailingAnchor,
                constant: -Sizes.Medium.padding
            ),
            nameTextField.topAnchor.constraint(
                equalTo: nameLabel.bottomAnchor,
                constant: Sizes.Small.padding
            )
        ])
    }
    // MARK: - Footer
    func setupFooter() {
    }
}
