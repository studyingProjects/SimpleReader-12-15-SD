//
//  LoginViewController.swift
//  SimpleReader-12-15-SD
//
//  Created by Andrei Shpartou on 19/04/2024.
//

import UIKit

protocol LoginViewControllerDelegate: AnyObject {
    func adjustScrollInset(with height: CGFloat)
    func adjustScrollOffset(with height: CGFloat)
    // func getCurrentOffset() -> CGFloat
}

class LoginViewController: UIViewController {
    weak var coordinator: CoordinatorProtocol?
    weak var delegate: LoginViewControllerDelegate?

    private var loginView: LoginView?

    // MARK: - Lifecycle
    override func loadView() {
        loginView = LoginView()
        view = loginView

        delegate = loginView
        loginView?.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Setup notification observers
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
//        // custom notification
//        NotificationCenter.default.addObserver(
//            self,
//            selector: #selector(executeCustomNotification),
//            name: .myCustomErrorNotification,
//            object: loginView
//        )
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        NotificationCenter.default.removeObserver(
            self,
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )

        NotificationCenter.default.removeObserver(
            self,
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
}

// MARK: - Action methods
private extension LoginViewController {

    @objc
    private func keyboardWillShow(notification: Notification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        // Calculating y position where keyboard overlap view
        guard let textField = view.selectedTextField else {
            return
        }
        // Convert from Subviews coordinates to View coordinates
        let textFieldOrigin = view.convert(textField.frame.origin, from: textField.superview)
        let positionYForChecking = textFieldOrigin.y + textField.frame.height + Sizes.Small.padding
        // Convert from UIWindows coordinates to View coordinates
        let keyboardOrigin = view.convert(keyboardSize.origin, from: view.window)

        delegate?.adjustScrollInset(with: keyboardSize.height)

        // if view.frame.origin.y == 0,
        if positionYForChecking > keyboardOrigin.y {
            // UIView.animate(withDuration: 0.5, animations: {
                self.delegate?.adjustScrollOffset(with: keyboardSize.height)
            // })
        }
    }

    @objc
    private func keyboardWillHide(notification: Notification) {
        // if view.frame.origin.y != 0 {
        delegate?.adjustScrollInset(with: 0)
    }

//    @objc private func executeCustomNotification() {
//        let abc = 10
//    }
}

// MARK: - LoginViewDelegate
extension LoginViewController: LoginViewDelegate {
    func loginPressed() {
        coordinator?.goToReader()
    }
}
