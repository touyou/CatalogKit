//
//  StoryboardInstantiable.swift
//  
//
//  Created by emp-mac-yosuke-fujii on 2021/12/10.
//

import UIKit

public protocol StoryboardInstantiable {
    static var storyboardName: String { get }
}

public extension StoryboardInstantiable where Self: UIViewController {
    static var storyboardName: String {
        return String(describing: self)
    }

    static func instantiate() -> Self {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        guard let controller = storyboard.instantiateInitialViewController() as? Self else {
            fatalError("Not Found \(storyboardName).swift.")
        }
        return controller
    }
}
