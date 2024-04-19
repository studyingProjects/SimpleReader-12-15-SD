//
//  LoginView.swift
//  SimpleReader-12-15-SD
//
//  Created by Andrei Shpartou on 19/04/2024.
//

import UIKit

class LoginView: UIView {
    // MARK: - Header Properties
    private lazy var welcomeImageView: UIImageView = {
        let image = UIImage(named: "Greeting")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true

        return imageView
    }()

    private lazy var welcomeLabel = UILabel(
        text: "Welcome Back!",
        font: .appXLargeBold,
        textColor: .darkText,
        textAlignment: .center
    )
    // MARK: - Body Properties
    private lazy var logIntoAccountLabel = UILabel(
        text: "Please Log into existing account",
        font: .appLargeBold,
        textColor: .secondaryLabel
    )

    private lazy var emailLabel = UILabel(
        text: "Email",
        font: .appMediumBold,
        textColor: .darkText
    )

    private lazy var emailTextField = UIBorderedTextField(
        placeholder: "Your Email",
        font: .appMediumBold
    )

    private lazy var passwordLabel = UILabel(
        text: "Password",
        font: .appMediumBold,
        textColor: .darkText
    )

    private lazy var passwordTextField = UIBorderedTextField(
        placeholder: "Your Password",
        font: .appMediumBold
    )
    // MARK: - Footer Properties
    private lazy var loginButton = UIButton(
        title: "Log in",
        font: UIFont.appMediumBold,
        titleColor: UIColor.white,
        backGroundColor: UIColor.greenButton,
        cornerRadius: Sizes.Medium.cornerRadius
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
    // MARK: - SetupView
    private func setupView() {
        backgroundColor = .primarySystemBackground
        addSubviews(
            welcomeImageView,
            welcomeLabel,
            logIntoAccountLabel,
            emailLabel,
            emailTextField,
            passwordLabel,
            passwordTextField,
            loginButton
        )
    }
}
// MARK: - Constraints
private extension LoginView {
    func setupConstraints() {
        setupHeaderConstraints()
        setupBodyConstraints()
        setupFooterConstraints()
    }

    func setupHeaderConstraints() {
        NSLayoutConstraint.activate([
            // welcomeImageView
            welcomeImageView.leadingAnchor.constraint(
                equalTo: layoutMarginsGuide.leadingAnchor,
                constant: Sizes.Medium.padding
            ),
            welcomeImageView.trailingAnchor.constraint(
                equalTo: layoutMarginsGuide.trailingAnchor,
                constant: -Sizes.Medium.padding
            ),
            welcomeImageView.topAnchor.constraint(
                equalTo: safeAreaLayoutGuide.topAnchor,
                constant: Sizes.Large.padding
            ),
            welcomeImageView.heightAnchor.constraint(equalToConstant: Sizes.Large.height),
            // welcomeLabel
            welcomeLabel.leadingAnchor.constraint(
                equalTo: layoutMarginsGuide.leadingAnchor,
                constant: Sizes.Medium.padding
            ),
            welcomeLabel.trailingAnchor.constraint(
                equalTo: layoutMarginsGuide.trailingAnchor,
                constant: -Sizes.Medium.padding
            ),
            welcomeLabel.topAnchor.constraint(
                equalTo: welcomeImageView.bottomAnchor,
                constant: Sizes.Large.padding
            ),
            // logIntoAccountLabel
            logIntoAccountLabel.leadingAnchor.constraint(
                equalTo: layoutMarginsGuide.leadingAnchor,
                constant: Sizes.Medium.padding
            ),
            logIntoAccountLabel.trailingAnchor.constraint(
                equalTo: layoutMarginsGuide.trailingAnchor,
                constant: -Sizes.Medium.padding
            ),
            logIntoAccountLabel.topAnchor.constraint(
                equalTo: welcomeLabel.bottomAnchor,
                constant: Sizes.Large.padding
            )
        ])
    }

    func setupBodyConstraints() {
        setupEmailConstraints()
        setupPasswordConstraints()
    }

    func setupEmailConstraints() {
        NSLayoutConstraint.activate([
            // emailLabel
            emailLabel.leadingAnchor.constraint(
                equalTo: layoutMarginsGuide.leadingAnchor,
                constant: Sizes.Medium.padding
            ),
            emailLabel.trailingAnchor.constraint(
                equalTo: layoutMarginsGuide.trailingAnchor,
                constant: -Sizes.Medium.padding
            ),
            emailLabel.topAnchor.constraint(
                equalTo: logIntoAccountLabel.bottomAnchor,
                constant: Sizes.Medium.padding
            ),
            // emailTextField
            emailTextField.leadingAnchor.constraint(
                equalTo: layoutMarginsGuide.leadingAnchor,
                constant: Sizes.Medium.padding
            ),
            emailTextField.trailingAnchor.constraint(
                equalTo: layoutMarginsGuide.trailingAnchor,
                constant: -Sizes.Medium.padding
            ),
            emailTextField.topAnchor.constraint(
                equalTo: emailLabel.bottomAnchor,
                constant: Sizes.Small.padding
            ),
            emailTextField.heightAnchor.constraint(equalToConstant: Sizes.Small.height)
        ])
    }

    func setupPasswordConstraints() {
        NSLayoutConstraint.activate([
            // passwordLabel
            passwordLabel.leadingAnchor.constraint(
                equalTo: layoutMarginsGuide.leadingAnchor,
                constant: Sizes.Medium.padding
            ),
            passwordLabel.trailingAnchor.constraint(
                equalTo: layoutMarginsGuide.trailingAnchor,
                constant: -Sizes.Medium.padding
            ),
            passwordLabel.topAnchor.constraint(
                equalTo: emailTextField.bottomAnchor,
                constant: Sizes.Medium.padding
            ),
            // passwordTextField
            passwordTextField.leadingAnchor.constraint(
                equalTo: layoutMarginsGuide.leadingAnchor,
                constant: Sizes.Medium.padding
            ),
            passwordTextField.trailingAnchor.constraint(
                equalTo: layoutMarginsGuide.trailingAnchor,
                constant: -Sizes.Medium.padding
            ),
            passwordTextField.topAnchor.constraint(
                equalTo: passwordLabel.bottomAnchor,
                constant: Sizes.Small.padding
            ),
            passwordTextField.heightAnchor.constraint(equalToConstant: Sizes.Small.height)
        ])
    }

    func setupFooterConstraints() {
        NSLayoutConstraint.activate([
            // loginButton
            loginButton.leadingAnchor.constraint(
                equalTo: layoutMarginsGuide.leadingAnchor,
                constant: Sizes.Medium.padding
            ),
            loginButton.trailingAnchor.constraint(
                equalTo: layoutMarginsGuide.trailingAnchor,
                constant: -Sizes.Medium.padding
            ),
            loginButton.topAnchor.constraint(
                equalTo: passwordTextField.bottomAnchor,
                constant: Sizes.Large.padding
            ),
            loginButton.heightAnchor.constraint(equalToConstant: Sizes.Medium.height)
        ])
    }
}
