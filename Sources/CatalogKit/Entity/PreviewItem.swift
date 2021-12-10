//
//  PreviewItem.swift
//  
//
//  Created by emp-mac-yosuke-fujii on 2021/12/09.
//

import SwiftUI

public struct PreviewItem {
    /// Component Title
    let title: String
    /// Component Preview
    let preview: AnyView
    
    public init<Content: View>(title: String, view: Content) {
        self.title = title
        self.preview = AnyView(view)
    }
}

