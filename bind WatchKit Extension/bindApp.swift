//
//  bindApp.swift
//  bind WatchKit Extension
//
//  Created by Wilton Ramos on 28/05/21.
//

import SwiftUI

@main
struct bindApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                InicialView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
