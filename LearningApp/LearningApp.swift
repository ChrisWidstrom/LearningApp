//
//  LearningAppApp.swift
//  LearningApp
//
//  Created by Christoffer Widstrom on 3/30/21.
//

import SwiftUI

@main
struct LearningApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ContentModel())
        }
    }
}
