//
//  UIView+App.swift
//  SimpleReader-12-15-SD
//
//  Created by Andrei Shpartou on 18/04/2024.
//

import UIKit

extension UIView {

    var textFieldsInView: [UITextField] {
        let filteredSubviews = subviews.filter { !($0 is UITextField) }

        return filteredSubviews.reduce(subviews.compactMap { $0 as? UITextField }, { summ, current in
                return summ + current.textFieldsInView
            })
    }

    var selectedTextField: UITextField? {
        return textFieldsInView.first(where: { $0.isFirstResponder })
    }

    func addSubviews(_ views: UIView...) {
        views.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview($0)
        }
    }
}
