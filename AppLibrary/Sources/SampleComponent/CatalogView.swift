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
                PreviewItem(title: "Button", previewType: SampleButtonAppearance_Previews.self),
                PreviewItem(title: "Colors", previewType: AppColor_Previews.self)
            ]),
            PreviewSection(title: "UIKit - Libs", items: [
                PreviewItem(title: "Button", previewType: SampleButtonUIKit_Previews.self),
                PreviewItem(title: "UIColors", previewType: AppUIColor_Previews.self)
            ])
        ])
    }
}

struct CatalogView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogView()
    }
}
