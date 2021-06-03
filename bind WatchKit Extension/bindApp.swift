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
                InicialView().navigationBarTitle("bind")
//                    .accentColor(Color("roxo"))
//                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
//                https://stackoverflow.com/questions/58035341/navigationbartitle-color-change-for-watchos-in-swiftui
                
            }
            
            .environment(\.managedObjectContext, container.viewContext)
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
