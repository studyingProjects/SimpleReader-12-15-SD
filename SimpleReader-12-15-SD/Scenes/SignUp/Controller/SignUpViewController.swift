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
        signUpView = SignUpView(frame: .zero)
        view = signUpView
    }
}
