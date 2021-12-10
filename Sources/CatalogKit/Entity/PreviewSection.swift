//
//  PreviewSection.swift
//  
//
//  Created by emp-mac-yosuke-fujii on 2021/12/09.
//

import Foundation

public struct PreviewSection {
    /// Section Title
    let title: String
    /// PreviewItems
    let items: [PreviewItem]

    public init(title: String, items: [PreviewItem]) {
        self.title = title
        self.items = items
    }
}
