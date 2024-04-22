//
//  SignUpViewController.swift
//  SimpleReader-12-15-SD
//
//  Created by Andrei Shpartou on 18/04/2024.
//
import UIKit

class SignUpViewController: UIViewController {
    weak var coordinator: CoordinatorProtocol?
    private var signUpView: UIView?

    // MARK: - Lifecycle
    override func loadView() {
        let rootView = SignUpView(frame: .zero)
        rootView.delegate = self

        signUpView = rootView
        view = signUpView
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
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Remove notification observers

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
private extension SignUpViewController {
    @objc
    private func keyboardWillShow(notification: Notification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        // Calculating y position where keyboard overlap view
        guard let textField = view.selectedTextField else {
            return
        }
        let positionYForChecking = textField.frame.origin.y + textField.frame.height + Sizes.Small.height
        // Convert from UIWindows coordinates to View coordinates
        let keyboardOrigin = view.convert(keyboardSize.origin, from: view.window)

        if view.frame.origin.y == 0,
           positionYForChecking > keyboardOrigin.y {
            UIView.animate(withDuration: 0.5, animations: {
                self.view.frame.origin.y -= keyboardSize.height
            })
        }
    }

    @objc
    private func keyboardWillHide(notification: Notification) {
        if view.frame.origin.y != 0 {
            view.frame.origin.y = 0
        }
    }
}

// MARK: - SignUpViewDelegate
extension SignUpViewController: SignUpViewDelegate {
    func goToLogin() {
        coordinator?.goToLogin()
    }
}

// MARK: - Custom Notifications
extension Notification.Name {
    static let myCustomErrorNotification = Notification.Name("ErrorTestNotification")
}
