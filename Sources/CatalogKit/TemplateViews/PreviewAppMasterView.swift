//
//  File.swift
//  
//
//  Created by emp-mac-yosuke-fujii on 2021/12/09.
//

import SwiftUI

public struct PreviewAppMasterView: View {
    let previewSections: [PreviewSection]
    @State private var selectedPreview: PreviewItem?

    public var body: some View {
        NavigationView {
            List {
                ForEach(previewSections, id: \.self) { section in
                    Section(header: Text(section.title)) {
                        ForEach(section.items, id: \.self) { preview in
                            Text(preview.title).onTapGesture {
                                self.selectedPreview = preview
                            }
                        }
                    }
                }
            }
        }
    }
}

private struct PreviewAppMasterView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewAppMasterView(previewSections: [
            PreviewSection(title: "First", items: [
                PreviewItem(title: "Item1", view: PreviewSample_Previews.previews),
                PreviewItem(title: "Item2", view: PreviewSample_Previews.previews),
                PreviewItem(title: "Item3", view: PreviewSample_Previews.previews)
            ]),
            PreviewSection(title: "Second", items: [
                PreviewItem(title: "Item1", view: PreviewSample_Previews.previews),
                PreviewItem(title: "Item2", view: PreviewSample_Previews.previews),
                PreviewItem(title: "Item3", view: PreviewSample_Previews.previews)
            ]),
            PreviewSection(title: "Third", items: [
                PreviewItem(title: "Item1", view: PreviewSample_Previews.previews),
                PreviewItem(title: "Item2", view: PreviewSample_Previews.previews),
                PreviewItem(title: "Item3", view: PreviewSample_Previews.previews)
            ])
        ])
    }
}

private struct PreviewSample_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello World")
    }
}
