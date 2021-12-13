//
//  PreviewAppMasterView.swift
//  
//
//  Created by emp-mac-yosuke-fujii on 2021/12/09.
//

import SwiftUI

public struct PreviewAppMasterView: View {
    let previewSections: [PreviewSection]

    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    @State private var selectedPreview: PreviewItem?
    @State private var isDark = false
    @State private var preferredColorScheme: ColorScheme?
    @State private var preferredDynamicTypeSize: DynamicTypeSize?

    public init(previewSections: [PreviewSection]) {
        self.previewSections = previewSections
    }
    
    public var body: some View {
        NavigationView {
            List {
                Section(header: HStack {
                    Image(systemName: "gearshape")
                    Text("Settings")
                }) {
                    Toggle("ダークモード", isOn: $isDark)
                        .onChange(of: isDark) { value in
                            preferredColorScheme = value ? .dark : .light
                        }
                    Stepper(onIncrement: generateOnIncrement(), onDecrement: generateOnDecrement()) {
                        Text("サイズ: " + dynamicTypeName())
                    }
                }
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
        .onAppear {
            self.isDark = colorScheme == .dark
        }
        .preferredColorScheme(preferredColorScheme)
        .dynamicTypeSize(preferredDynamicTypeSize ?? dynamicTypeSize)
    }

    private func dynamicTypeName() -> String {
        let size = preferredDynamicTypeSize ?? dynamicTypeSize
        return String(describing: size)
    }

    private func generateOnIncrement() -> (() -> Void)? {
        let size = preferredDynamicTypeSize ?? dynamicTypeSize
        if let index = DynamicTypeSize.allCases.firstIndex(of: size) {
            if index == DynamicTypeSize.allCases.count - 1 {
                return nil
            } else {
                return {
                    preferredDynamicTypeSize = DynamicTypeSize.allCases[index + 1]
                }
            }
        }
        return nil
    }

    private func generateOnDecrement() -> (() -> Void)? {
        let size = preferredDynamicTypeSize ?? dynamicTypeSize
        if let index = DynamicTypeSize.allCases.firstIndex(of: size) {
            if index == 0 {
                return nil
            } else {
                return {
                    preferredDynamicTypeSize = DynamicTypeSize.allCases[index - 1]
                }
            }
        }
        return nil
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
