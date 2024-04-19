//
//  UIFont+App.swift
//  SimpleReader-12-15-SD
//
//  Created by Andrei Shpartou on 18/04/2024.
//
import UIKit

extension UIFont {
    // Plan
    static var appSmall: UIFont {
        UIFont.systemFont(ofSize: 12)
    }
    static var appMedium: UIFont {
        UIFont.systemFont(ofSize: 16)
    }
    static var appLarge: UIFont {
        UIFont.systemFont(ofSize: 20)
    }
    static var appXLarge: UIFont {
        UIFont.systemFont(ofSize: 24)
    }
    // Bold
    static var appSmallBold: UIFont {
        UIFont.systemFont(ofSize: 12, weight: .bold)
    }
    static var appMediumBold: UIFont {
        UIFont.systemFont(ofSize: 16, weight: .bold)
    }
    static var appLargeBold: UIFont {
        UIFont.systemFont(ofSize: 20, weight: .bold)
    }
    static var appXLargeBold: UIFont {
        UIFont.systemFont(ofSize: 24, weight: .bold)
    }
}
