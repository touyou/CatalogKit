//
//  CatalogView.swift
//  
//
//  Created by emp-mac-yosuke-fujii on 2021/12/10.
//

import SwiftUI
import CatalogKit

public struct CatalogView: View {
    public init() {}
    
    public var body: some View {
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

struct CatalogView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogView()
    }
}
