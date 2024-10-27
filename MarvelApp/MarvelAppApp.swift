//
//  MarvelAppApp.swift
//  MarvelApp
//
//  Created by Jessica Tarra on 28/09/24.
//

import SwiftData
import SwiftUI

@main
struct MarvelAppApp: App {
    init() {
        /// Injecting all dependencies
        DI.shared.injectModules()
    }

    var body: some Scene {
        WindowGroup {
            ContainerView()
        }
    }
}
