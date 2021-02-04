//
//  MEWEApp.swift
//  MEWE
//
//  Created by Keunna Lee on 2021/01/21.
//

import SwiftUI

@main
struct MEWEApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            TodayView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
