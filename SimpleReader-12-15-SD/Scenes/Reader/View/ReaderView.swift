//
//  ReaderView.swift
//  SimpleReader-12-15-SD
//
//  Created by Andrei Shpartou on 22/04/2024.
//

import UIKit

class ReaderView: UIView {
    // MARK: - Properties
    private lazy var readerTextView = {
        let textView = UITextView()
        textView.font = .appMediumBold
        textView.textColor = .secondaryLabel
        textView.showsVerticalScrollIndicator = false
        textView.textAlignment = .natural
        textView.isEditable = false
        textView.textContainerInset = .init(
            top: Sizes.Medium.padding,
            left: Sizes.Medium.padding,
            bottom: Sizes.Medium.padding,
            right: Sizes.Medium.padding
        )

        return textView
    }()

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - LifeCycle
    override func layoutSubviews() {
        super.layoutSubviews()

        readerTextView.setContentOffset(.zero, animated: true)
    }

    // MARK: - SetupView
    private func setupView() {
        backgroundColor = .primarySystemBackground
        addSubviews(readerTextView)

        setupSubView()
    }

    private func setupSubView() {
        let testString = """
        Overview
        UITextView supports the display of text using custom style information and also supports text editing.\
        You typically use a text view to display multiple lines of text, such as when displaying the body of a large text document.\
        This class supports multiple text styles through use of the attributedText property.
        (Styled text isn’t supported in versions of iOS earlier than iOS 6.)\
        Setting a value for this property causes the text view to use the style information provided in the attributed string.\
        You can still use the font, textColor, and textAlignment properties to set style attributes,\
        but those properties apply to all of the text in the text view.\
        It’s recommended that you use a text view—and not a UIWebView object—to display both plain and rich text in your app."
                Overview
                UITextView supports the display of text using custom style information and also supports text editing.\
                You typically use a text view to display multiple lines of text, such as when displaying the body of a large text document.\
                This class supports multiple text styles through use of the attributedText property.
                (Styled text isn’t supported in versions of iOS earlier than iOS 6.)\
                Setting a value for this property causes the text view to use the style information provided in the attributed string.\
                You can still use the font, textColor, and textAlignment properties to set style attributes,\
                but those properties apply to all of the text in the text view.\
                It’s recommended that you use a text view—and not a UIWebView object—to display both plain and rich text in your app."
                Overview
                UITextView supports the display of text using custom style information and also supports text editing.\
                You typically use a text view to display multiple lines of text, such as when displaying the body of a large text document.\
                This class supports multiple text styles through use of the attributedText property.
                (Styled text isn’t supported in versions of iOS earlier than iOS 6.)\
                Setting a value for this property causes the text view to use the style information provided in the attributed string.\
                You can still use the font, textColor, and textAlignment properties to set style attributes,\
                but those properties apply to all of the text in the text view.\
                It’s recommended that you use a text view—and not a UIWebView object—to display both plain and rich text in your app.
                        You typically use a text view to display multiple lines of text, such as when displaying the body of a large text document.\
                        This class supports multiple text styles through use of the attributedText property.
                        (Styled text isn’t supported in versions of iOS earlier than iOS 6.)\
                        Setting a value for this property causes the text view to use the style information provided in the attributed string.\
                        You can still use the font, textColor, and textAlignment properties to set style attributes,\
                        but those properties apply to all of the text in the text view.\
                        It’s recommended that you use a text view—and not a UIWebView object—to display both plain and rich text in your app."
        """
        let attributedText = NSMutableAttributedString(string: testString)
        attributedText.addAttribute(
            .link,
            value: "https://developer.apple.com/documentation/uikit/uitextview",
            range: NSRange(location: 0, length: 8)
        )
        readerTextView.attributedText = attributedText
    }
}

// MARK: - Constraints
private extension ReaderView {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            readerTextView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            readerTextView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            readerTextView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            readerTextView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
