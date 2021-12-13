//
//  AppColor.swift
//  
//
//  Created by emp-mac-yosuke-fujii on 2021/12/10.
//

import SwiftUI
import UIKit
import FigmaComponents
import CatalogKit

struct AppColor_Previews: PreviewProvider {
    static var previews: some View {
        TemplateColorView(title: "App Colors", sections: [
            PreviewColorSection(name: "Background", colors: [
                PreviewColor(color: Color.backgroundPrimary, name: "Primary"),
                PreviewColor(color: Color.backgroundSecondary, name: "Secondary")
            ]),
            PreviewColorSection(name: "Button", colors: [
                PreviewColor(color: Color.button, name: "Normal"),
                PreviewColor(color: Color.buttonPressed, name: "Pressed"),
            ]),
            PreviewColorSection(name: "Text", colors: [
                PreviewColor(color: Color.textPrimary, name: "Primary"),
                PreviewColor(color: Color.textSecondary, name: "Secondary"),
            ]),
            PreviewColorSection(colors: [PreviewColor(color: Color.tint, name: "Tint"),])
        ])
    }
}

struct AppUIColor_Previews: PreviewProvider {
    static var previews: some View {
        TemplateColorView(title: "App UIColors", colors: [
            PreviewColor(uiColor: UIColor.backgroundPrimary, name: "Background Primary"),
            PreviewColor(uiColor: UIColor.backgroundSecondary, name: "Background Secondary"),
            PreviewColor(uiColor: UIColor.button, name: "Button"),
            PreviewColor(uiColor: UIColor.buttonPressed, name: "Button Pressed"),
            PreviewColor(uiColor: UIColor.textPrimary, name: "Text Secondary"),
            PreviewColor(uiColor: UIColor.textSecondary, name: "Text Secondary"),
            PreviewColor(uiColor: UIColor.tint, name: "Tint"),
        ])
    }
}

