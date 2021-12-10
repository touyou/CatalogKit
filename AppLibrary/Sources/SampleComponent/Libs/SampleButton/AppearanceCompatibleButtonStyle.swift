//
//  AppearanceCompatibleButtonStyle.swift
//  
//
//  Created by emp-mac-yosuke-fujii on 2021/12/09.
//

import SwiftUI

public extension Button {
    /// generics appearance modifier
    func withAppearance<T>(_ appearance: T) -> some View where T: ButtonAppearance {
        buttonStyle(AppearanceCompatibleButtonStyle(appearance: appearance))
    }
    
    /// sample button appearance modifier
    func sampleAppearance(_ appearance: SampleButtonAppearance) -> some View {
        withAppearance(appearance)
    }
}

struct AppearanceCompatibleButtonStyle: ButtonStyle {
    let appearance: ButtonAppearance
    
    func makeBody(configuration: Configuration) -> some View {
        Label(appearance: appearance, configuration: configuration)
    }
    
    private struct Label: View {
        let appearance: ButtonAppearance
        let configuration: ButtonStyle.Configuration
        let cornerRadius: CGFloat = 10.0
        @Environment(\.isEnabled) private var isEnabled: Bool
        
        var body: some View {
            configuration.label
                .padding(.vertical, 8.0)
                .padding(.horizontal, 16.0)
                .font(appearance.font.weight(appearance.fontWeight))
                .foregroundColor(foregroundColor(isPressed: configuration.isPressed))
                .frame(maxWidth: .infinity, minHeight: appearance.minHeight)
                .background(backgroundView)
                .clipped()
        }
        
        @ViewBuilder
        private var backgroundView: some View {
            if appearance.isOutlined {
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .stroke(backgroundColor(isPressed: configuration.isPressed), lineWidth: 1)
            } else {
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .fill(backgroundColor(isPressed: configuration.isPressed))
            }
        }
        
        private func foregroundColor(isPressed: Bool) -> Color {
            if isEnabled {
                return appearance.foregroundColor.opacity(isPressed ? 0.5 : 1.0)
            } else {
                return appearance.disabledForegroundColor
            }
        }
        
        private func backgroundColor(isPressed: Bool) -> Color {
            if isEnabled {
                return appearance.backgroundColor.opacity(isPressed ? 0.5 : 1.0)
            } else {
                return appearance.disabledBackgroundColor
            }
        }
    }
}
