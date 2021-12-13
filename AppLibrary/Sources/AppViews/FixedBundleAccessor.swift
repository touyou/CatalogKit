//
//  FixedBundleAccessor.swift
//  
//
//  Created by emp-mac-yosuke-fujii on 2021/12/13.
//

import Foundation

private class CurrentBundleFinder {}

extension Foundation.Bundle {
    static var appViewModule: Bundle = {
        /* The name of your local package, prepended by "LocalPackages_" */
        let bundleName = "AppLibrary_AppViews"
        let candidates = [
            /* Bundle should be present here when the package is linked into an App. */
            Bundle.main.resourceURL,
            /* Bundle should be present here when the package is linked into a framework. */
            Bundle(for: CurrentBundleFinder.self).resourceURL,
            /* For command-line tools. */
            Bundle.main.bundleURL,
            /* Bundle should be present here when running previews from a different package (this is the path to "…/Debug-iphonesimulator/"). */
            Bundle(for: CurrentBundleFinder.self).resourceURL?.deletingLastPathComponent().deletingLastPathComponent(),
        ]
        for candidate in candidates {
            let bundlePath = candidate?.appendingPathComponent(bundleName + ".bundle")
            if let bundle = bundlePath.flatMap(Bundle.init(url:)) {
                return bundle
            }
        }
        fatalError("unable to find bundle named \(bundleName)")
    }()
}

