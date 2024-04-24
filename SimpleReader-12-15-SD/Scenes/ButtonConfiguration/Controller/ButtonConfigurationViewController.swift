//
//  ButtonConfigurationViewController.swift
//  SimpleReader-12-15-SD
//
//  Created by Andrei Shpartou on 23/04/2024.
//

import UIKit

protocol ButtonConfigViewControllerDelegate: AnyObject {
    func secondsChanged(_ seconds: Int)
}

class ButtonConfigurationViewController: UIViewController, ButtonViewDelegate {
    weak var coordinator: MainCoordinator?
    weak var delegate: ButtonConfigViewControllerDelegate?

    private var buttonConfigurationView: ButtonConfigurationView?
    private var stopWatch: Stopwatch?

    // MARK: - LifeCycle
    override func loadView() {
        buttonConfigurationView = ButtonConfigurationView()
        buttonConfigurationView?.delegate = self
        view = buttonConfigurationView
        delegate = buttonConfigurationView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        stopWatch = Stopwatch()
    }
}

// MARK: - Action methods
private extension ButtonConfigurationViewController {
    @objc
    private func secondsChanged(_ notification: NSNotification) {
        guard let userInfo = notification.userInfo,
              let seconds = userInfo["seconds"] as? Int else {
            return
        }

        delegate?.secondsChanged(seconds)
    }
}

// MARK: - ButtonViewDelegate
extension ButtonConfigurationViewController {

    func start() {
        stopWatch?.start()

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(secondsChanged),
            name: .secondsChanged,
            object: nil
        )
    }

    func pause() {
        stopWatch?.pause()
    }

    func stop() {
        stopWatch?.stop()

        NotificationCenter.default.removeObserver(
            self,
            name: .secondsChanged,
            object: nil
        )
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
