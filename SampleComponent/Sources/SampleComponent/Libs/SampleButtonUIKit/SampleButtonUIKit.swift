//
//  File.swift
//  
//
//  Created by emp-mac-yosuke-fujii on 2021/12/09.
//

import SwiftUI
import UIKit
import CatalogKit

@IBDesignable
public class SampleButton: UIButton {
    @IBInspectable
    public var titleFont: UIFont = UIFont.preferredFont(forTextStyle: .headline) {
        didSet {
            titleLabel?.font = titleFont
        }
    }
    @IBInspectable
    public var titleColor: UIColor = UIColor.white {
        didSet {
            setTitleColor(titleColor, for: .normal)
        }
    }
    @IBInspectable
    public var disabledTitleColor: UIColor = UIColor(white: 1.0, alpha: 0.8) {
        didSet {
            setTitleColor(disabledTitleColor, for: .disabled)
        }
    }
    @IBInspectable
    public var defaultBackgroundColor: UIColor = UIColor.blue
    @IBInspectable
    public var disabledBackgroundColor: UIColor = UIColor.gray
    @IBInspectable
    public var minHeight: CGFloat = 44.0 {
        didSet {

        }
    }
    @IBInspectable
    public var isOutlined: Bool = false {
        didSet {
            changeBorder()
        }
    }

    public override var isEnabled: Bool {
        didSet {
            changeBackgroundColor()
        }
    }

    public func configureProps(
        font: UIFont,
        titleColor: UIColor,
        backgroundColor: UIColor,
        disabledTitleColor: UIColor,
        disabledBackgroundColor: UIColor,
        minHeight: CGFloat,
        isOutlined: Bool
    ) {
        self.titleFont = font
        self.titleColor = titleColor
        self.disabledTitleColor = disabledTitleColor
        self.defaultBackgroundColor = backgroundColor
        self.disabledBackgroundColor = disabledBackgroundColor
        self.minHeight = minHeight
        self.isOutlined = isOutlined
        configure()
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }

    private func configure() {
        layer.masksToBounds = true
        layer.cornerRadius = 10.0
        contentEdgeInsets = UIEdgeInsets(top: 8.0, left: 16.0, bottom: 8.0, right: 16.0)
        setTitleColor(titleColor, for: .normal)
        setTitleColor(disabledTitleColor, for: .disabled)
        titleLabel?.font = titleFont
        changeBackgroundColor()
        changeBorder()
    }

    private func changeBackgroundColor() {
        if isEnabled {
            backgroundColor = isOutlined ? .clear : defaultBackgroundColor
        } else {
            backgroundColor = isOutlined ? .clear : disabledBackgroundColor
        }
    }

    private func changeBorder() {
        layer.borderColor = (isOutlined ? backgroundColor : .clear)?.cgColor
        layer.borderWidth = isOutlined ? 1.0 : 0.0
    }
}

public extension SampleButton {
    static let largeFilled: SampleButton = {
        let button = SampleButton()
        button.configureProps(
            font: UIFont.preferredFont(for: .headline, weight: .bold),
            titleColor: UIColor.white,
            backgroundColor: UIColor.blue,
            disabledTitleColor: UIColor(white: 1.0, alpha: 0.8),
            disabledBackgroundColor: UIColor.gray,
            minHeight: 44.0,
            isOutlined: false
        )
        return button
    }()

    static let largeOutlined: SampleButton = {
        let button = SampleButton()
        button.configureProps(
            font: UIFont.preferredFont(for: .headline, weight: .bold),
            titleColor: UIColor.blue,
            backgroundColor: UIColor.blue,
            disabledTitleColor: UIColor.gray,
            disabledBackgroundColor: UIColor.gray,
            minHeight: 44.0,
            isOutlined: true
        )
        return button
    }()

    static let largePlane: SampleButton = {
        let button = SampleButton()
        button.configureProps(
            font: UIFont.preferredFont(for: .headline, weight: .bold),
            titleColor: UIColor.blue,
            backgroundColor: UIColor.clear,
            disabledTitleColor: UIColor.gray,
            disabledBackgroundColor: UIColor.clear,
            minHeight: 44.0,
            isOutlined: false
        )
        return button
    }()

    static let mediumFilled: SampleButton = {
        let button = SampleButton()
        button.configureProps(
            font: UIFont.preferredFont(for: .body, weight: .regular),
            titleColor: UIColor.white,
            backgroundColor: UIColor.blue,
            disabledTitleColor: UIColor(white: 1.0, alpha: 0.8),
            disabledBackgroundColor: UIColor.gray,
            minHeight: 40.0,
            isOutlined: false
        )
        return button
    }()

    static let mediumOutlined: SampleButton = {
        let button = SampleButton()
        button.configureProps(
            font: UIFont.preferredFont(for: .body, weight: .regular),
            titleColor: UIColor.blue,
            backgroundColor: UIColor.blue,
            disabledTitleColor: UIColor.gray,
            disabledBackgroundColor: UIColor.gray,
            minHeight: 40.0,
            isOutlined: true
        )
        return button
    }()

    static let mediumPlane: SampleButton = {
        let button = SampleButton()
        button.configureProps(
            font:UIFont.preferredFont(for: .body, weight: .regular),
            titleColor: UIColor.blue,
            backgroundColor: UIColor.clear,
            disabledTitleColor: UIColor.gray,
            disabledBackgroundColor: UIColor.clear,
            minHeight: 44.0,
            isOutlined: false
        )
        return button
    }()
}

public struct ViewWrapper: UIViewRepresentable {
    let view: SampleButton
    let title: String
    @Environment(\.isEnabled) private var isEnabled: Bool

    public func makeUIView(context: Context) -> SampleButton {
        view.setTitle(title, for: .normal)
        return view
    }

    public func updateUIView(_ uiView: SampleButton, context: Context) {
        uiView.isEnabled = isEnabled
    }
}

public struct SampleButtonUIKit_Previews: PreviewProvider {
    public static var previews: some View {
        TemplateScrollVStack(title: "UIKit Button Styles") {
            HStack(spacing: 4.0) {
                ViewWrapper(view: .largeFilled, title: "Large Filled")
                ViewWrapper(view: .largeFilled, title: "Large Filled Disabled")
                    .disabled(true)
            }
            HStack(spacing: 4.0) {
                ViewWrapper(view: .mediumFilled, title: "Medium Filled")
                ViewWrapper(view: .mediumFilled, title: "Medium Filled Disabled")
                    .disabled(true)
            }
            HStack(spacing: 4.0) {
                ViewWrapper(view: .largeOutlined, title: "Large Outlined")
                ViewWrapper(view: .largeOutlined, title: "Large Outlined Disabled")
                    .disabled(true)
            }
            HStack(spacing: 4.0) {
                ViewWrapper(view: .mediumOutlined, title: "Medium Outlined")
                ViewWrapper(view: .mediumOutlined, title: "Medium Outlined Disabled")
                    .disabled(true)
            }
            HStack(spacing: 4.0) {
                ViewWrapper(view: .largePlane, title: "Large Plane")
                ViewWrapper(view: .largePlane, title: "Large Plane Disabled")
                    .disabled(true)
            }
            HStack(spacing: 4.0) {
                ViewWrapper(view: .mediumPlane, title: "Medium Plane")
                ViewWrapper(view: .mediumPlane, title: "Medium Plane Disabled")
                    .disabled(true)
            }
        }
    }
}
