//
//  UIButton+App.swift
//  SimpleReader-12-15-SD
//
//  Created by Andrei Shpartou on 19/04/2024.
//
import UIKit

extension UIButton {
    convenience init(
        title: String?,
        font: UIFont?,
        titleColor: UIColor?,
        backGroundColor: UIColor?,
        cornerRadius: CGFloat = 0
    ) {
        self.init()

        self.setTitle(title, for: .normal)
        self.titleLabel?.font = font
        self.setTitleColor(titleColor, for: .normal)
        self.setTitleColor(UIColor.tintButton, for: .highlighted)
        self.backgroundColor = backGroundColor
        self.layer.cornerRadius = cornerRadius
    }
}
