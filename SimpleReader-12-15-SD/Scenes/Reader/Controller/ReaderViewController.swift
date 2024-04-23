//
//  ReaderViewController.swift
//  SimpleReader-12-15-SD
//
//  Created by Andrei Shpartou on 22/04/2024.
//

import UIKit

class ReaderViewController: UIViewController {
    weak var coordinator: MainCoordinator?

    private var readerView: UIView?

    override func loadView() {
        readerView = ReaderView()
        view = readerView
    }
}

import SwiftUI
struct ViewControllerProvider: PreviewProvider {
    static var previews: some View {
        Group {
            // change to your ViewController
            ReaderViewController().preview()
        }
    }
}
