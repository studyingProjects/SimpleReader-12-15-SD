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

    static func getDefaultFilledButton(
        title: String,
        isDefaultImageConfig: Bool = false,
        action: UIAction?
    ) -> UIButton {
        var config = UIButton.Configuration.filled()
        config.attributedTitle = AttributedString(
            title,
            attributes: AttributeContainer([NSAttributedString.Key.font: UIFont.appLargeBold])
        )
        config.baseBackgroundColor = .greenButton
        config.baseForegroundColor = .white
        config.cornerStyle = .large
        config.buttonSize = .large

        if isDefaultImageConfig {
            config.imagePlacement = .trailing
            config.contentInsets = NSDirectionalEdgeInsets(
                top: Sizes.Small.padding,
                leading: Sizes.Small.padding,
                bottom: Sizes.Small.padding,
                trailing: Sizes.Small.padding
            )
            config.imagePadding = Sizes.Small.padding
            config.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(scale: .large)
        }

        return UIButton(configuration: config, primaryAction: action)
    }
}
