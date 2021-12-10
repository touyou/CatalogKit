//
//  ContentView.swift
//  CatalogSample
//
//  Created by emp-mac-yosuke-fujii on 2021/12/09.
//

import SwiftUI
import SampleComponent
import CatalogKit

struct ContentView: View {
    var body: some View {
        PreviewAppMasterView(previewSections: [
            PreviewSection(title: "SwiftUI - Libs", items: [
                PreviewItem(title: "Button", view: SampleButtonAppearance_Previews.previews)
            ]),
            PreviewSection(title: "UIKit - Libs", items: [
                PreviewItem(title: "Button", view: SampleButtonUIKit_Previews.previews)
            ])
        ])
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
