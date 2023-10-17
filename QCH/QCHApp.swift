//
//  QCHApp.swift
//  QCH
//
//  Created by David Dong on 2023/10/10.
//

import SwiftUI

@main
struct QCHApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MarketingView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
