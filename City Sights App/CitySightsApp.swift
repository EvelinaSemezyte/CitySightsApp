//
//  CitySightsApp.swift
//  City Sights App

//
//  Created by Evelina Semezyte on 2022-03-08.
//

import SwiftUI

@main
struct CitySightsApp: App {
    var body: some Scene {
        WindowGroup {
            LaunchView()
                .environmentObject(ContentModel())
        }
    }
}
