//
//  File.swift
//  
//
//  Created by emp-mac-yosuke-fujii on 2021/12/09.
//

import UIKit
import SwiftUI

public struct PreviewItem<PreviewType: PreviewProvider> {
    /// Component Title
    let title: String
    /// Component Preview
    let preview: PreviewType
}
