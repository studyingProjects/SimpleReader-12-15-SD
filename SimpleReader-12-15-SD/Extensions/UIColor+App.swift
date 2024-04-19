//
//  UIColor+App.swift
//  SimpleReader-12-15-SD
//
//  Created by Andrei Shpartou on 18/04/2024.
//

import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        let redValue = CGFloat(red) / 255.0
        let greenValue = CGFloat(green) / 255.0
        let blueValue = CGFloat(blue) / 255.0
        self.init(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
    }
}

extension UIColor {
    // MARK: - Background Colors
    static var primarySystemBackground: UIColor {
        UIColor.systemBackground
    }
    // MARK: - Border Colors {
    static var selectedBorder: UIColor {
        UIColor.tintColor
    }
    static var unselectedBorder: UIColor {
        UIColor.systemGray3
    }
    // MARK: - Button Colors
    static var tintButton: UIColor {
        UIColor.tintColor
    }
    static var greenButton: UIColor {
        UIColor(red: 99, green: 198, blue: 148)
    }
}
