//
//  SignUpViewController.swift
//  SimpleReader-12-15-SD
//
//  Created by Andrei Shpartou on 18/04/2024.
//

import UIKit

class SignUpViewController: UIViewController {
weak var coordinator: CoordinatorProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .appBackground
    }
}

import SwiftUI
struct ViewControllerProvider: PreviewProvider {
    static var previews: some View {
        Group {
            // change to your vc
            SignUpViewController().preview()
        }
    }
}
