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

    override func loadView() {
        let rootView = SignUpView(frame: .zero)
        rootView.delegate = self

        signUpView = rootView
        view = signUpView
    }
}

extension SignUpViewController: SignUpViewDelegate {
    func goToLogin() {
        coordinator?.goToLogin()
    }
}
