//
//  File.swift
//  
//
//  Created by emp-mac-yosuke-fujii on 2021/12/09.
//

import SwiftUI

public protocol ButtonAppearance {
    var font: Font { get }
    var fontWeight: Font.Weight { get }
    var foregroundColor: Color { get }
    var backgroundColor: Color { get }
    var disabledForegroundColor: Color { get }
    var disabledBackgroundColor: Color { get }
    var minHeight: CGFloat { get }
    var isOutlined: Bool { get }
}
