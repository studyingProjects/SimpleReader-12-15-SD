//
//  UIBorderedTextField.swift
//  SimpleReader-12-15-SD
//
//  Created by Andrei Shpartou on 19/04/2024.
//

import UIKit

class UIBorderedTextField: UITextField {
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    convenience init(
        placeholder: String?,
        font: UIFont?
    ) {
        self.init()

        self.placeholder = placeholder
        self.font = font

        setupPaddings()
    }
    // MARK: - LyfeCycle
    override func layoutSubviews() {
        super.layoutSubviews()

        frame.size.height = Sizes.Small.height
    }
    // MARK: - Setup View
    private func setupView() {
        contentVerticalAlignment = .center
        // layer
        layer.borderColor = UIColor.unselectedBorder.cgColor
        layer.borderWidth = Sizes.Medium.borderWidth
        layer.cornerRadius = Sizes.Small.cornerRadius
    }
    // MARK: - Helper methods
    func setupPaddings() {
        let paddingFrame = CGRect(x: 0, y: 0, width: Sizes.Medium.padding, height: Sizes.XSmall.height)
        let paddingView = UIView(frame: paddingFrame)

        leftView = paddingView
        leftViewMode = .always
        rightView = paddingView
        rightViewMode = .always
    }
}
