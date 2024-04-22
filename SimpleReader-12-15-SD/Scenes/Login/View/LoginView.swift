//
//  LoginView.swift
//  SimpleReader-12-15-SD
//
//  Created by Andrei Shpartou on 19/04/2024.
//

import UIKit

// class TestNotification {
//
//    init() {
//        NotificationCenter.default.addObserver(
//            self,
//            selector: #selector(executeCustomNotification),
//            name: .myCustomErrorNotification,
//            object: nil
//        )
//        NotificationCenter.default.addObserver(
//            self,
//            selector: #selector(executeCustomNotification2),
//            name: .myCustomErrorNotification,
//            object: nil
//        )
//    }
//
//    @objc
//    private func executeCustomNotification() {
//        let abc = 1
//    }
//    
//    @objc
//    private func executeCustomNotification2() {
//        let abc = 1
//    }
// }

class LoginView: UIView {
    // var testObject: TestNotification? = TestNotification()
    // MARK: - View Model Properties
    private var arrayOfTextFields = [UITextField]()

    // MARK: - Main ScrollView
    private lazy var scrollView = UIScrollView()
    private lazy var scrollContentView = UIView()

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
        font: .appMediumBold,
        keyboardType: .emailAddress
    )

    private lazy var passwordLabel = UILabel(
        text: "Password",
        font: .appMediumBold,
        textColor: .darkText
    )

    private lazy var passwordTextField = UIPasswordTextField(
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
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewWasTaped))
        addGestureRecognizer(tapGestureRecognizer)

        // Setup view model
        arrayOfTextFields = [emailTextField, passwordTextField]
        arrayOfTextFields.enumerated().forEach { index, textField in
            textField.tag = index
        }

        // Setup subviews
        addSubviews(scrollView)
        scrollView.addSubviews(scrollContentView)
        scrollView.showsVerticalScrollIndicator = false
        scrollView.delaysContentTouches = false

        scrollContentView.addSubviews(
            welcomeImageView,
            welcomeLabel,
            logIntoAccountLabel,
            emailLabel,
            emailTextField,
            passwordLabel,
            passwordTextField,
            loginButton
        )

        setupSubviews()
    }

    private func setupSubviews() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }

    // MARK: - Action methods
    @objc
    private func viewWasTaped() {
        endEditing(true)
    }
}

// MARK: - UITextFieldDelegate
extension LoginView: UITextFieldDelegate {
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
        // MARK: - Test custom notification
//        // custom notification
//        NotificationCenter.default.post(name: .myCustomErrorNotification, object: nil)
//        testObject = nil

        return true
    }
}

// MARK: - LoginViewControllerDelegate
extension LoginView: LoginViewControllerDelegate {

    func adjustScrollInset(with height: CGFloat) {
        scrollView.contentInset.bottom = height
    }

    func adjustScrollOffset(with height: CGFloat) {
        scrollView.setContentOffset(CGPoint(x: 0, y: height), animated: true)
    }
}

// MARK: - Constraints
private extension LoginView {
    func setupConstraints() {
        setupMainScrollConstraints()
        setupHeaderConstraints()
        setupBodyConstraints()
        setupFooterConstraints()
    }

    func setupMainScrollConstraints() {
        NSLayoutConstraint.activate([
            // scrollView
            scrollView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            // scrollContentView
            scrollContentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            scrollContentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            scrollContentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            scrollContentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            scrollContentView.heightAnchor.constraint(equalTo: scrollView.frameLayoutGuide.heightAnchor),
            scrollContentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor)
//            scrollContentView.heightAnchor.constraint(equalTo: heightAnchor)
        ])
        // Set content view priority
        scrollContentView.setContentHuggingPriority(.defaultLow, for: .vertical)
    }

    func setupHeaderConstraints() {
        NSLayoutConstraint.activate([
            // welcomeImageView
            welcomeImageView.leadingAnchor.constraint(
                equalTo: scrollContentView.layoutMarginsGuide.leadingAnchor,
                constant: Sizes.Medium.padding
            ),
            welcomeImageView.trailingAnchor.constraint(
                equalTo: scrollContentView.layoutMarginsGuide.trailingAnchor,
                constant: -Sizes.Medium.padding
            ),
            welcomeImageView.topAnchor.constraint(
                equalTo: scrollContentView.safeAreaLayoutGuide.topAnchor,
                constant: Sizes.Large.padding
            ),
            welcomeImageView.heightAnchor.constraint(equalToConstant: Sizes.Large.height),
            // welcomeLabel
            welcomeLabel.leadingAnchor.constraint(
                equalTo: scrollContentView.layoutMarginsGuide.leadingAnchor,
                constant: Sizes.Medium.padding
            ),
            welcomeLabel.trailingAnchor.constraint(
                equalTo: scrollContentView.layoutMarginsGuide.trailingAnchor,
                constant: -Sizes.Medium.padding
            ),
            welcomeLabel.topAnchor.constraint(
                equalTo: welcomeImageView.bottomAnchor,
                constant: Sizes.Large.padding
            ),
            // logIntoAccountLabel
            logIntoAccountLabel.leadingAnchor.constraint(
                equalTo: scrollContentView.layoutMarginsGuide.leadingAnchor,
                constant: Sizes.Medium.padding
            ),
            logIntoAccountLabel.trailingAnchor.constraint(
                equalTo: scrollContentView.layoutMarginsGuide.trailingAnchor,
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
                equalTo: scrollContentView.layoutMarginsGuide.leadingAnchor,
                constant: Sizes.Medium.padding
            ),
            emailLabel.trailingAnchor.constraint(
                equalTo: scrollContentView.layoutMarginsGuide.trailingAnchor,
                constant: -Sizes.Medium.padding
            ),
            emailLabel.topAnchor.constraint(
                equalTo: logIntoAccountLabel.bottomAnchor,
                constant: Sizes.Medium.padding
            ),
            // emailTextField
            emailTextField.leadingAnchor.constraint(
                equalTo: scrollContentView.layoutMarginsGuide.leadingAnchor,
                constant: Sizes.Medium.padding
            ),
            emailTextField.trailingAnchor.constraint(
                equalTo: scrollContentView.layoutMarginsGuide.trailingAnchor,
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
                equalTo: scrollContentView.layoutMarginsGuide.leadingAnchor,
                constant: Sizes.Medium.padding
            ),
            passwordLabel.trailingAnchor.constraint(
                equalTo: scrollContentView.layoutMarginsGuide.trailingAnchor,
                constant: -Sizes.Medium.padding
            ),
            passwordLabel.topAnchor.constraint(
                equalTo: emailTextField.bottomAnchor,
                constant: Sizes.Medium.padding
            ),
            // passwordTextField
            passwordTextField.leadingAnchor.constraint(
                equalTo: scrollContentView.layoutMarginsGuide.leadingAnchor,
                constant: Sizes.Medium.padding
            ),
            passwordTextField.trailingAnchor.constraint(
                equalTo: scrollContentView.layoutMarginsGuide.trailingAnchor,
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
                equalTo: scrollContentView.layoutMarginsGuide.leadingAnchor,
                constant: Sizes.Medium.padding
            ),
            loginButton.trailingAnchor.constraint(
                equalTo: scrollContentView.layoutMarginsGuide.trailingAnchor,
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
