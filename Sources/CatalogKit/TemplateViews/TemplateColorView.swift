//
//  TemplateColorView.swift
//  
//
//  Created by emp-mac-yosuke-fujii on 2021/12/10.
//

import SwiftUI

public struct TemplateColorView: View {
    let title: String
    let sections: [PreviewColorSection]
    
    public init(title: String, colors: [PreviewColor]) {
        self.title = title
        self.sections = [PreviewColorSection(colors: colors)]
    }

    public init(title: String, sections: [PreviewColorSection]) {
        self.title = title
        self.sections = sections
    }
    
    public var body: some View {
        TemplateScrollVStack(title: title) {
            ForEach(0 ..< sections.count, id: \.self) { sectionIndex in
                VStack(alignment: .leading, spacing: 8.0) {
                    Divider()
                    if let name = sections[sectionIndex].name {
                        Text(name).font(.title2.weight(.semibold))
                    }
                    ForEach(Array(stride(from: 0, to: sections[sectionIndex].colors.count, by: 2)), id: \.self) { index in
                        HStack(spacing: 8.0) {
                            ColorStack(color: sections[sectionIndex].colors[index])
                            if index + 1 < sections[sectionIndex].colors.count {
                                ColorStack(color: sections[sectionIndex].colors[index + 1])
                            }
                        }
                    }
                }
            }
        }
    }
    
    private struct ColorStack: View {
        let color: PreviewColor
        
        var body: some View {
            HStack(spacing: 8.0) {
                ZStack {
                    Circle()
                        .fill(color.color)
                    Circle()
                        .strokeBorder(color.color, lineWidth: 2.0)
                        .colorInvert()
                }
                    .frame(width: 44.0, height: 44.0, alignment: .center)
                Text(color.name).font(.body.weight(.semibold))
                Spacer()
            }
        }
    }
}
