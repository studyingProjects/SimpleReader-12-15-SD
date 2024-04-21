//
//  UIView+App.swift
//  SimpleReader-12-15-SD
//
//  Created by Andrei Shpartou on 18/04/2024.
//

import UIKit

extension UIView {

    var textFieldsInView: [UITextField] {
        return subviews
            .filter ({ !($0 is UITextField) })
            .reduce (( subviews.compactMap { $0 as? UITextField }), { summ, current in
                return summ + current.textFieldsInView
            })
    }

    var selectedTextField: UITextField? {
        return textFieldsInView.filter { $0.isFirstResponder }.first
    }

    func addSubviews(_ views: UIView...) {
        views.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview($0)
        }
    }
    
}
