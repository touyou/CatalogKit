//
//  PreviewSample.swift
//  
//
//  Created by emp-mac-yosuke-fujii on 2021/12/10.
//

import SwiftUI

struct PreviewSample: View {
    var body: some View {
        Text("Hello World \(Int.random(in: 0..<100))")
    }
}

struct PreviewSample_Previews: PreviewProvider {
    static var previews: some View {
        PreviewSample()
    }
}
