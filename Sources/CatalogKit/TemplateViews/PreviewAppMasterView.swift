//
//  PreviewAppMasterView.swift
//  
//
//  Created by emp-mac-yosuke-fujii on 2021/12/09.
//

import SwiftUI

public struct PreviewAppMasterView: View {
    let previewSections: [PreviewSection]
    @State private var selectedPreview: PreviewItem?

    public init(previewSections: [PreviewSection]) {
        self.previewSections = previewSections
    }
    
    public var body: some View {
        NavigationView {
            List {
                ForEach(0 ..< previewSections.count, id: \.self) { index in
                    let section = previewSections[index]
                    Section(header: Text(section.title)) {
                        ForEach(0 ..< section.items.count, id: \.self) { itemIndex in
                            let preview = section.items[itemIndex]
                            HStack {
                                Text(preview.title)
                                Spacer()
                            }
                            .contentShape(Rectangle())
                            .onTapGesture {
                                self.selectedPreview = preview
                            }
                        }
                    }
                }
            }
            .listStyle(.automatic)
            
            if let selectedPreview = selectedPreview {
                selectedPreview.preview
            } else {
                VStack(alignment: .center) {
                    Text("プレビューするコンポーネントを選んでください")
                        .font(.body)
                        .foregroundColor(.gray)
                    Spacer()
                }
            }
        }
    }
}

struct PreviewAppMasterView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewAppMasterView(previewSections: [
            PreviewSection(title: "First", items: [
                PreviewItem(title: "Item1", previewType: PreviewSample_Previews.self),
                PreviewItem(title: "Item2", previewType: PreviewSample_Previews.self),
                PreviewItem(title: "Item3", previewType: PreviewSample_Previews.self)
            ]),
            PreviewSection(title: "Second", items: [
                PreviewItem(title: "Item1", previewType: PreviewSample_Previews.self),
                PreviewItem(title: "Item2", previewType: PreviewSample_Previews.self),
                PreviewItem(title: "Item3", previewType: PreviewSample_Previews.self)
            ]),
            PreviewSection(title: "Third", items: [
                PreviewItem(title: "Item1", previewType: PreviewSample_Previews.self),
                PreviewItem(title: "Item2", previewType: PreviewSample_Previews.self),
                PreviewItem(title: "Item3", previewType: PreviewSample_Previews.self)
            ])
        ])
    }
}
