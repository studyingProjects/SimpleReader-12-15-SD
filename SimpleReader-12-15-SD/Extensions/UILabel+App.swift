//
//  UILabel+App.swift
//  SimpleReader-12-15-SD
//
//  Created by Andrei Shpartou on 19/04/2024.
//
import UIKit

extension UILabel {
    convenience init(
        text: String?,
        font: UIFont?,
        textColor: UIColor,
        textAlignment: NSTextAlignment = .natural
    ) {
        self.init()
        self.text = text
        self.font = font
        self.textColor = textColor
        self.textAlignment = textAlignment
        self.numberOfLines = 0
        self.adjustsFontSizeToFitWidth = true
        self.minimumScaleFactor = 0.5
    }
}
