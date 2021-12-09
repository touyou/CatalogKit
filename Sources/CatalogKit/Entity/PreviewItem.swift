//
//  File.swift
//  
//
//  Created by emp-mac-yosuke-fujii on 2021/12/09.
//

import UIKit
import SwiftUI

public struct PreviewItem: View, Identifiable {
    public typealias ID = AnyHashable
    private let _id: ID
    public var id: ID {
        return _id
    }

    /// Component Title
    let title: String
    /// Component Preview
    private let _preview: AnyView
    public var body: some View {
        _preview
    }

    init?<Content>(title: String, view: Content?) where Content: View & Identifiable{
        guard let view = view else { return nil }
        self.title = title
        self._preview = AnyView(view)
        self._id = view.id
    }
}

public extension Identifiable where Self: Hashable {
    typealias ID = Self
    var id: Self { self }
}
