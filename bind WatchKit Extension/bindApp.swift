//
//  bindApp.swift
//  bind WatchKit Extension
//
//  Created by Wilton Ramos on 28/05/21.
//

import SwiftUI

@main
struct bindApp: App {
    
    @State private var navigationID = UUID()
    let container = PersistenceController.shared.container
    
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                InicialView().navigationBarTitle("bind")                
            }.id(navigationID)
            .onReceive(NotificationCenter.default.publisher(for: Notification.Name("successToInicialView"))) { output in
                        navigationID = UUID()
                    }
            .environment(\.managedObjectContext, container.viewContext)
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
