//
//  SampleButtonAppearance.swift
//  
//
//  Created by emp-mac-yosuke-fujii on 2021/12/09.
//

import SwiftUI
import CatalogKit

public struct SampleButtonAppearance: ButtonAppearance {
    public let font: Font
    public let fontWeight: Font.Weight
    public let foregroundColor: Color
    public let backgroundColor: Color
    public let disabledForegroundColor: Color
    public let disabledBackgroundColor: Color
    public let minHeight: CGFloat
    public let isOutlined: Bool
    
    static let largeFilled = SampleButtonAppearance(
        font: .headline,
        fontWeight: .semibold,
        foregroundColor: Color.white,
        backgroundColor: Color.blue,
        disabledForegroundColor: Color(white: 1.0, opacity: 0.8),
        disabledBackgroundColor: Color.gray,
        minHeight: 44.0,
        isOutlined: false
    )
    
    static let largeOutlined = SampleButtonAppearance(
        font: .headline,
        fontWeight: .semibold,
        foregroundColor: Color.blue,
        backgroundColor: Color.blue,
        disabledForegroundColor: Color.gray,
        disabledBackgroundColor: Color.gray,
        minHeight: 44.0,
        isOutlined: true
    )
    
    static let largePlane = SampleButtonAppearance(
        font: .headline,
        fontWeight: .semibold,
        foregroundColor: Color.blue,
        backgroundColor: Color.clear,
        disabledForegroundColor: Color.gray,
        disabledBackgroundColor: Color.clear,
        minHeight: 44.0,
        isOutlined: false
    )
    
    static let mediumFilled = SampleButtonAppearance(
        font: .body,
        fontWeight: .regular,
        foregroundColor: Color.white,
        backgroundColor: Color.blue,
        disabledForegroundColor: Color(white: 1.0, opacity: 0.8),
        disabledBackgroundColor: Color.gray,
        minHeight: 36.0,
        isOutlined: false
    )
    
    static let mediumOutlined = SampleButtonAppearance(
        font: .body,
        fontWeight: .regular,
        foregroundColor: Color.blue,
        backgroundColor: Color.blue,
        disabledForegroundColor: Color.gray,
        disabledBackgroundColor: Color.gray,
        minHeight: 36.0,
        isOutlined: true
    )
    
    static let mediumPlane = SampleButtonAppearance(
        font: .body,
        fontWeight: .regular,
        foregroundColor: Color.blue,
        backgroundColor: Color.clear,
        disabledForegroundColor: Color.gray,
        disabledBackgroundColor: Color.clear,
        minHeight: 36.0,
        isOutlined: false
    )
}

public struct SampleButtonAppearance_Previews: PreviewProvider {
    public static var previews: some View {
        TemplateScrollVStack(title: "Button Style") {
            HStack(spacing: 4.0) {
                Button("Large Filled") {}
                .sampleAppearance(.largeFilled)
                Button("Large Filled Disabled") {}
                .sampleAppearance(.largeFilled)
                .disabled(true)
            }
            HStack(spacing: 4.0) {
                Button("Medium Filled") {}
                .sampleAppearance(.mediumFilled)
                Button("Medium Filled Disabled") {}
                .sampleAppearance(.mediumFilled)
                .disabled(true)
            }
            HStack(spacing: 4.0) {
                Button("Large Outlined") {}
                .sampleAppearance(.largeOutlined)
                Button("Large Outlined Disabled") {}
                .sampleAppearance(.largeOutlined)
                .disabled(true)
            }
            HStack(spacing: 4.0) {
                Button("Medium Outlined") {}
                .sampleAppearance(.mediumOutlined)
                Button("Medium Outlined Disabled") {}
                .sampleAppearance(.mediumOutlined)
                .disabled(true)
            }
            HStack(spacing: 4.0) {
                Button("Large Plane") {}
                .sampleAppearance(.largePlane)
                Button("Large Plane Disabled") {}
                .sampleAppearance(.largePlane)
                .disabled(true)
            }
            HStack(spacing: 4.0) {
                Button("Medium Plane") {}
                .sampleAppearance(.mediumPlane)
                Button("Medium Plane Disabled") {}
                .sampleAppearance(.mediumPlane)
                .disabled(true)
            }
        }
    }
}
