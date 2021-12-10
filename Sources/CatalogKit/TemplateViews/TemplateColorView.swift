//
//  TemplateColorView.swift
//  
//
//  Created by emp-mac-yosuke-fujii on 2021/12/10.
//

import SwiftUI

public struct TemplateColorView: View {
    let title: String
    let colors: [PreviewColor]
    
    public init(title: String, colors: [PreviewColor]) {
        self.title = title
        self.colors = colors
    }
    
    public var body: some View {
        TemplateScrollVStack(title: title) {
            ForEach(Array(stride(from: 0, to: colors.count, by: 2)), id: \.self) { index in
                HStack(spacing: 8.0) {
                    ColorStack(color: colors[index])
                    if index + 1 < colors.count {
                        ColorStack(color: colors[index + 1])
                    }
                }
            }
        }
    }
    
    private struct ColorStack: View {
        let color: PreviewColor
        
        var body: some View {
            HStack(spacing: 4.0) {
                Circle().fill(color.color).frame(width: 44.0, height: 44.0, alignment: .center)
                Text(color.name).font(.body.weight(.semibold))
                Spacer()
            }
        }
    }
}
