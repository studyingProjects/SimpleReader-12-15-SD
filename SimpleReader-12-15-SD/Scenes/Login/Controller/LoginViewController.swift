//
//  LoginViewController.swift
//  SimpleReader-12-15-SD
//
//  Created by Andrei Shpartou on 19/04/2024.
//

import UIKit

class LoginViewController: UIViewController {
    weak var coordinator: CoordinatorProtocol?
    private var loginView: UIView?

    // MARK: - Deinit
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    // MARK: - Lyfecycle
    override func loadView() {
        loginView = LoginView()
        view = loginView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

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

    // MARK: - Action methods
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
            view.frame.origin.y -= keyboardSize.height
        }
    }

    @objc
    private func keyboardWillHide(notification: Notification) {
        if view.frame.origin.y != 0 {
            view.frame.origin.y = 0
        }
    }
}

import SwiftUI
struct ViewControllerProvider: PreviewProvider {
    static var previews: some View {
        Group {
            // change to your vc
            LoginViewController().preview()
        }
    }
}
