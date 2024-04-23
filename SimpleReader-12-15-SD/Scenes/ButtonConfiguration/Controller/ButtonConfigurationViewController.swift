//
//  ButtonConfigurationViewController.swift
//  SimpleReader-12-15-SD
//
//  Created by Andrei Shpartou on 23/04/2024.
//

import UIKit

class ButtonConfigurationViewController: UIViewController {
    weak var coordinator: MainCoordinator?

    private var buttonConfigurationView: ButtonConfigurationView?

    // MARK: - LifeCycle
    override func loadView() {
        buttonConfigurationView = ButtonConfigurationView()
        view = buttonConfigurationView
    }
}

import SwiftUI
struct ViewControllerProvider: PreviewProvider {
    static var previews: some View {
        Group {
            // change to your ViewController
            ButtonConfigurationViewController().preview()
        }
    }
}
