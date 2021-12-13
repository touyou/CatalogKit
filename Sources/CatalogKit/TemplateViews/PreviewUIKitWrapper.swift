//
//  PreviewUIKitWrapper.swift
//  
//
//  Created by emp-mac-yosuke-fujii on 2021/12/13.
//

import SwiftUI

public struct PreviewUIKitWrapper<T: UIView>: View {
    let view: T

    public init(view: T) {
        self.view = view
    }

    public var body: some View {
        InternalViewWrapper(view: view)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .fixedSize(horizontal: false, vertical: true)
    }

    private struct InternalViewWrapper: UIViewRepresentable {
        let view: T

        public func makeUIView(context: Context) -> T {
            return view
        }

        public func updateUIView(_ uiView: T, context: Context) {
            uiView.layoutIfNeeded()
        }
    }
}
