//
//  TemplateScrollVStack.swift
//  
//
//  Created by emp-mac-yosuke-fujii on 2021/12/09.
//

import SwiftUI

public struct TemplateScrollVStack<Content: View>: View {
    let title: String
    @ViewBuilder let content: () -> Content

    public init(title: String, @ViewBuilder content: @escaping () -> Content) {
        self.title = title
        self.content = content
    }

    public var body: some View {
        ScrollView {
            VStack(spacing: 16.0) {
                Text(title).font(.title.weight(.semibold))
                LazyVStack(spacing: 8.0) {
                    content()
                }
            }
            .padding(16.0)
        }
        .background(Color(UIColor.systemBackground))
    }
}

