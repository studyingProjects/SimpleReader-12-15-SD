//
//  SignUpView.swift
//  SimpleReader-12-15-SD
//
//  Created by Andrei Shpartou on 18/04/2024.
//

import UIKit

protocol SignUpViewDelegate: AnyObject {
    func goToLogin()
}

class SignUpView: UIView {
    weak var delegate: SignUpViewDelegate?

    // MARK: - View Model Properties
    private var arrayOfTextFields = [UITextField]()

    // MARK: - Header Properties
    private lazy var signUpLabel = UILabel(
        text: "Sign Up",
        font: .appXLargeBold,
        textColor: .darkText
    )

    private lazy var enterDetailsLabel = UILabel(
        text: "Please enter your details",
        font: .appMediumBold,
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
        font: .appMediumBold,
        keyboardType: .namePhonePad
    )

    private lazy var emailLabel = UILabel(
        text: "Email",
        font: .appMediumBold,
        textColor: .darkText
    )

    private lazy var emailTextField = UIBorderedTextField(
        placeholder: "Example@mail.com",
        font: .appMediumBold,
        keyboardType: .emailAddress
    )

    private lazy var passwordLabel = UILabel(
        text: "Password",
        font: .appMediumBold,
        textColor: .darkText
    )

    private lazy var passwordTextField = UIPasswordTextField(
        placeholder: "At least 8 characters",
        font: .appMediumBold
    )

    // MARK: - Footer properties
    private lazy var termsSwitch: UISwitch = {
        let switcher = UISwitch()
        switcher.preferredStyle = .checkbox
        return switcher
    }()

    private lazy var termsPrivacyLabel = UILabel(
        text: "I agree with Terms and Privacy",
        font: UIFont.appMediumBold,
        textColor: .secondaryLabel
    )

    private lazy var signUpButton = UIButton(
        title: "Sign up",
        font: UIFont.appMediumBold,
        titleColor: UIColor.white,
        backGroundColor: UIColor.tintButton,
        cornerRadius: Sizes.Medium.cornerRadius
    )

    private lazy var haveAccountLabel = UILabel(
        text: "Already have an account?",
        font: UIFont.appMediumBold,
        textColor: .secondaryLabel,
        textAlignment: .center
    )

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

    // MARK: - Setup View
    func setupView() {
        // Setup view
        backgroundColor = .primarySystemBackground

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewWasTapped))
        addGestureRecognizer(tapGestureRecognizer)

        // Setup view model
        arrayOfTextFields = [nameTextField, emailTextField, passwordTextField]
        arrayOfTextFields.enumerated().forEach { index, textField in
            textField.tag = index
        }

        // Setup subviews
        addSubviews(
            signUpLabel,
            enterDetailsLabel,
            nameLabel,
            nameTextField,
            emailLabel,
            emailTextField,
            passwordLabel,
            passwordTextField,
            termsSwitch,
            termsPrivacyLabel,
            signUpButton,
            haveAccountLabel,
            loginButton
        )

        setupSubViews()
    }

    func setupSubViews() {
        nameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self

        loginButton.addTarget(self, action: #selector(goToLogin), for: .touchUpInside)
    }

    // MARK: - Action methods
    @objc
    private func viewWasTapped() {
        endEditing(true)
    }

    @objc
    private func goToLogin() {
        delegate?.goToLogin()
    }
}
// MARK: - UITextFieldDelegate
extension SignUpView: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Highlight selected TextField
        textField.layer.borderColor = UIColor.selectedBorder.cgColor
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        // Deselect TextField with default color
        textField.layer.borderColor = UIColor.unselectedBorder.cgColor
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Select the next TextField if exists
        if let nextTextField = viewWithTag(textField.tag + 1) {
            nextTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }

        return true
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
        setupNameConstraints()
        setupEmailConstraints()
        setupPasswordConstraints()
    }

    func setupNameConstraints() {
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
                constant: Sizes.Medium.padding
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
            ),
            nameTextField.heightAnchor.constraint(equalToConstant: Sizes.Small.height)
        ])
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
                equalTo: nameTextField.bottomAnchor,
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
    // MARK: - Footer
    func setupFooter() {
        setupTermsPrivacyConstraints()
        setupFooterButtons()
    }

    func setupTermsPrivacyConstraints() {
        NSLayoutConstraint.activate([
            // termsSwitch
            termsSwitch.leadingAnchor.constraint(
                equalTo: layoutMarginsGuide.leadingAnchor,
                constant: Sizes.Medium.padding
            ),
            termsSwitch.topAnchor.constraint(
                equalTo: passwordTextField.bottomAnchor,
                constant: Sizes.XLarge.padding
            ),
            // termsPrivacyLabel
            termsPrivacyLabel.leadingAnchor.constraint(
                equalTo: termsSwitch.trailingAnchor,
                constant: Sizes.Small.padding
            ),
            termsPrivacyLabel.centerYAnchor.constraint(equalTo: termsSwitch.centerYAnchor),
            termsPrivacyLabel.trailingAnchor.constraint(
                equalTo: layoutMarginsGuide.trailingAnchor,
                constant: -Sizes.Medium.padding
            )
        ])
    }

    func setupFooterButtons() {
        NSLayoutConstraint.activate([
            // signUpButton
            signUpButton.leadingAnchor.constraint(
                equalTo: layoutMarginsGuide.leadingAnchor,
                constant: Sizes.Medium.padding
            ),
            signUpButton.trailingAnchor.constraint(
                equalTo: layoutMarginsGuide.trailingAnchor,
                constant: -Sizes.Medium.padding
            ),
            signUpButton.topAnchor.constraint(
                equalTo: termsPrivacyLabel.bottomAnchor,
                constant: Sizes.Medium.padding
            ),
            signUpButton.heightAnchor.constraint(equalToConstant: Sizes.Medium.height),
            // haveAccountLabel
            haveAccountLabel.leadingAnchor.constraint(
                equalTo: layoutMarginsGuide.leadingAnchor,
                constant: Sizes.Medium.padding
            ),
            haveAccountLabel.trailingAnchor.constraint(
                equalTo: layoutMarginsGuide.trailingAnchor,
                constant: -Sizes.Medium.padding
            ),
            haveAccountLabel.topAnchor.constraint(
                equalTo: signUpButton.bottomAnchor,
                constant: Sizes.Large.padding
            ),
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
                equalTo: haveAccountLabel.bottomAnchor,
                constant: Sizes.Medium.padding
            ),
            loginButton.heightAnchor.constraint(equalToConstant: Sizes.Medium.height)
        ])
    }
}
