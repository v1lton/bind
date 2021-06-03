//
//  bindApp.swift
//  bind WatchKit Extension
//
//  Created by Wilton Ramos on 28/05/21.
//

import SwiftUI

@main
struct bindApp: App {
    let container = PersistenceController.shared.container
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
//                InicialView()
                ActivityView(duration: Binding.constant(" "), bpm: Binding.constant(" "), calories: Binding.constant(" "))
            }
            .environment(\.managedObjectContext, container.viewContext)
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
