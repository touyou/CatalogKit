//
//  SampleButtonUIKit.swift
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
    public var minHeight: CGFloat = 44.0
    @IBInspectable
    public var isOutlined: Bool = false {
        didSet {
            changeBorder()
        }
    }
    
    public override var isEnabled: Bool {
        didSet {
            changeBackgroundColor()
            changeBorder()
        }
    }
    
    public override var isHighlighted: Bool {
        didSet {
            changeBackgroundColor()
            changeBorder()
        }
    }

    public override var intrinsicContentSize: CGSize {
        self.sizeToFit()
        if self.frame.height < self.minHeight {
            var newSize = super.intrinsicContentSize
            newSize.height = self.minHeight
            return newSize
        } else {
            return super.intrinsicContentSize
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
        layoutIfNeeded()
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
        setTitleColor(titleColor.withAlphaComponent(0.5), for: .highlighted)
        setTitleColor(disabledTitleColor, for: .disabled)
        titleLabel?.font = titleFont
        changeBackgroundColor()
        changeBorder()
    }
    
    private func changeBackgroundColor() {
        if isEnabled {
            backgroundColor = isOutlined || defaultBackgroundColor == .clear ? .clear : defaultBackgroundColor.withAlphaComponent(isHighlighted ? 0.5 : 1.0)
        } else {
            backgroundColor = isOutlined || disabledBackgroundColor == .clear ? .clear : disabledBackgroundColor.withAlphaComponent(isHighlighted ? 0.5 : 1.0)
        }
    }
    
    private func changeBorder() {
        let borderColor = isEnabled ? defaultBackgroundColor : disabledBackgroundColor
        layer.borderColor = (isOutlined ? borderColor.withAlphaComponent(isHighlighted ? 0.5 : 1.0) : .clear).cgColor
        layer.borderWidth = isOutlined ? 1.0 : 0.0
    }
}

public extension SampleButton {
    static func largeFilled(title: String) -> SampleButton {
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
        button.setTitle(title, for: .normal)
        return button
    }
    
    static func largeOutlined(title: String) -> SampleButton {
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
        button.setTitle(title, for: .normal)
        return button
    }
    
    static func largePlane(title: String) -> SampleButton {
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
        button.setTitle(title, for: .normal)
        return button
    }
    
    static func mediumFilled(title: String) -> SampleButton {
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
        button.setTitle(title, for: .normal)
        return button
    }
    
    static func mediumOutlined(title: String) -> SampleButton {
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
        button.setTitle(title, for: .normal)
        return button
    }
    
    static func mediumPlane(title: String) -> SampleButton {
        let button = SampleButton()
        button.configureProps(
            font:UIFont.preferredFont(for: .body, weight: .regular),
            titleColor: UIColor.blue,
            backgroundColor: UIColor.clear,
            disabledTitleColor: UIColor.gray,
            disabledBackgroundColor: UIColor.clear,
            minHeight: 40.0,
            isOutlined: false
        )
        button.setTitle(title, for: .normal)
        return button
    }
}

struct SampleButtonUIKit_Previews: PreviewProvider {
    static var previews: some View {
        TemplateScrollVStack(title: "UIKit Button Styles") {
            HStack(spacing: 4.0) {
                PreviewUIKitWrapper<SampleButton>(view: .largeFilled(title: "Large Filled"))
                PreviewUIKitWrapper<SampleButton>(view: .largeFilled(title: "Large Filled Disabled"))
                    .disabled(true)
            }
            HStack(spacing: 4.0) {
                PreviewUIKitWrapper<SampleButton>(view: .mediumFilled(title: "Medium Filled"))
                PreviewUIKitWrapper<SampleButton>(view: .mediumFilled(title: "Medium Filled Disabled"))
                    .disabled(true)
            }
            HStack(spacing: 4.0) {
                PreviewUIKitWrapper<SampleButton>(view: .largeOutlined(title: "Large Outlined"))
                PreviewUIKitWrapper<SampleButton>(view: .largeOutlined(title: "Large Outlined Disabled"))
                    .disabled(true)
            }
            HStack(spacing: 4.0) {
                PreviewUIKitWrapper<SampleButton>(view: .mediumOutlined(title: "Medium Outlined"))
                PreviewUIKitWrapper<SampleButton>(view: .mediumOutlined(title: "Medium Outlined Disabled"))
                    .disabled(true)
            }
            HStack(spacing: 4.0) {
                PreviewUIKitWrapper<SampleButton>(view: .largePlane(title: "Large Plane"))
                PreviewUIKitWrapper<SampleButton>(view: .largePlane(title: "Large Plane Disabled"))
                    .disabled(true)
            }
            HStack(spacing: 4.0) {
                PreviewUIKitWrapper<SampleButton>(view: .mediumPlane(title: "Medium Plane"))
                PreviewUIKitWrapper<SampleButton>(view: .mediumPlane(title: "Medium Plane Disabled"))
                    .disabled(true)
            }
        }
    }
}
