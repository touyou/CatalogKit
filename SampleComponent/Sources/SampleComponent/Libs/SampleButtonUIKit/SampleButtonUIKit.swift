//
//  File.swift
//  
//
//  Created by emp-mac-yosuke-fujii on 2021/12/09.
//

import SwiftUI
import UIKit

public class SampleButton: UIButton {

}

public struct SampleButtonUIKit_Previews: PreviewProvider {
    struct ViewWrapper: UIViewRepresentable {
        func makeUIView(context: Context) -> some UIView {
            return UIView()
        }

        func updateUIView(_ uiView: UIViewType, context: Context) {

        }
    }

    public static var previews: some View {
        ViewWrapper()
    }
}
