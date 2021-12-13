//
//  PreviewColor.swift
//  
//
//  Created by emp-mac-yosuke-fujii on 2021/12/10.
//

import SwiftUI
import UIKit

public struct PreviewColor {
    /// Color data
    let color: Color
    /// Name
    let name: String

    public init(color: Color, name: String) {
        self.color = color
        self.name = name
    }

    public init(uiColor: UIColor, name: String) {
        self.name = name
        self.color = Color(uiColor)
    }
}

public struct PreviewColorSection {
    /// Section Name
    let name: String?
    /// Color datas
    let colors: [PreviewColor]

    public init(name: String? = nil, colors: [PreviewColor]) {
        self.name = name
        self.colors = colors
    }
}
