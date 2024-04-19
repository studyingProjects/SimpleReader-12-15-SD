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

    override func loadView() {
        loginView = LoginView()
        view = loginView
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
